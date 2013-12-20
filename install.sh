#!/bin/bash

# Create directories

PREFIX="$HOME"
DIRS=( backup bin man .vim/bundle/vundle )
BACKUP_DIR="backup"

while getopts ":p:" OPTION; do
    case "${OPTION}" in
        p)
            PREFIX="$OPTARG"
            echo "Prefix sets to $PREFIX"
            ;;
        \?)
            echo "Unknown option: $option"
            exit 8
            ;;
        :)
            echo "Option -$OPTARG requires an argument."
            exit 16
    esac
done

# Check if git is installed
git --version 2>&1 >/dev/null

GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -ne 0 ]; then
    echo "Git seems missing from your system, check your \$PATH or make sure it is correctly installed"
    exit 24
fi

if [ ! -d "$PREFIX/" ]; then
    mkdir -p "$PREFIX"
fi

# Create common directories
for DIR in "${DIRS[@]}"
do
    if [ ! -d "$PREFIX/$DIR" ]; then
        echo "Creating $PREFIX/$DIR"
        mkdir -p $PREFIX/$DIR
    else
        echo "Omitting $PREFIX/$DIR"
    fi
done

# Vundle (vim plugin manager)
echo "Fetching Vundle..."
git clone https://github.com/gmarik/vundle.git "$PREFIX/.vim/bundle/vundle"
echo "Installing Vundle..."
if [ -f "$PREFIX/.vimrc" ]; then
    TIMESTAMP=$(date "+%s")
    echo ".vimrc already exists, backing up to $PREFIX/$BACKUP_DIR/.vimrc_$TIMESTAMP"
#    mv "$PREFIX/.vimrc" "$PREFIX/$BACKUP_DIR/.vimrc_$TIMESTAMP"
fi

cp ./.vimrc "$PREFIX/"
vim +BundleInstall +qall

