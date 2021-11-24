#!/bin/sh
URL=https://papermc.io/api/v2/projects/paper

if [ -z $MC_VERSION ] || [ $MC_VERSION = latest ]
then
    MC_VERSION=$(curl $URL | jq -r '.versions[-1]')
fi

URL=${URL}/versions/${MC_VERSION}
PAPER_BUILD=$(curl $URL | jq '.builds[-1]')
URL=${URL}/builds/${PAPER_BUILD}/downloads/paper-${MC_VERSION}-${PAPER_BUILD}.jar
curl $URL -o paper.jar