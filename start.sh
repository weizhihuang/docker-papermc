#!/bin/sh

if [ -z $SRV_RAM ]
then
    SRV_RAM=2G
fi

java -Xmx$SRV_RAM -jar paper.jar
