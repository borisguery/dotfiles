setopt extendedglob


# Changing Directories

## If a command is issued that can't be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_CD 

## Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD

## Don't push multiple copies of the same directory onto the directory stack. 
setopt PUSHD_IGNORE_DUPS

## Resolve symbolic links to their true values when changing directory. This also has the effect of CHASE_DOTS, i.e. a '..' path segment will be treated as referring to the physical parent, even if the preceding path segment is a symbolic link.
setopt CHASE_LINKS

## If a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word. That is, the cursor is moved to the end of the word if either a single match is inserted or menu completion is performed.

# Completion

## If a completion is performed with the cursor within a word, and a full completion is inserted, the cursor is moved to the end of the word. That is, the cursor is moved to the end of the word if either a single match is inserted or menu completion is performed.
setopt ALWAYS_TO_END

## If a parameter is completed whose content is the name of a directory, then add a trailing slash instead of a space.
setopt AUTO_PARAM_SLASH

# Expansion and Globbing

# History
## If this is set, zsh sessions will append their history list to the history file, rather than replace it. Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file, in the order that they exit. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt APPEND_HISTORY

## Do not enter command lines into the history list if they are duplicates of the previous event.
setopt HIST_IGNORE_DUPS

## Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line. If you want to make it vanish right away without entering another command, type a space and press return.
setopt HIST_IGNORE_SPACE

## This options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt INC_APPEND_HISTORY

## This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY). The history lines are also output with timestamps ala EXTENDED_HISTORY (which makes it easier to find the spot where we left off reading the file after it gets re-written).
setopt SHARE_HISTORY

# Initialisation

