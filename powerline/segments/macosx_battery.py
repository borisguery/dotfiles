#!/usr/bin/env python
# coding=UTF-8

from __future__ import absolute_import

import subprocess, math

def battery(pl, base=3):
    cmd = 'ioreg -n AppleSmartBattery -r \
     | awk \'$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%%"; max=c["\"MaxCapacity\""]; print (max>0? 100*c["\"CurrentCapacity\""]/max: "?")}\''

    # Set locale to default C to make sure to use a period as decimal separator
    batteryUsageCmd = 'ioreg -n AppleSmartBattery -r | LC_ALL=C awk \'$1~/Capacity/{c[$1]=$3} END{OFMT="%g"; max=c["\\\"MaxCapacity\\\""]; print (max>0? 100*c["\\\"CurrentCapacity\\\""]/max: "?")}\''

    p = subprocess.Popen(batteryUsageCmd, stdout=subprocess.PIPE, shell=True)

    batteryUsage = float(p.communicate()[0].strip())
    print batteryUsage 
    batteryUsage = int(round(batteryUsage / base * base))
    print batteryUsage 
    powerSupplyIsPluggedCmd = 'ioreg -n AppleSmartBattery -r | awk \'$1~/ExternalConnected/{gsub("Yes", "+");gsub("No", ""); print substr($0, length, 1)}\''

    p = subprocess.Popen(powerSupplyIsPluggedCmd, stdout=subprocess.PIPE, shell=True)
    isPuggled = p.communicate()[0].strip()

    return [{
        'contents': isPuggled + str(batteryUsage) + '%',
        'highlight_group': ['battery_gradient', 'battery'],
        'gradient_level': int(100 - batteryUsage) 
        }]

if __name__=="__main__":
    print battery("")
