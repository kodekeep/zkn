#!/bin/sh

# script taken from
# https://github.com/CalinLeafshade/dots/blob/master/bin/bin/notetaker
# video
# https://www.youtube.com/watch?v=zB_3FIGRWRU
noteFilename="$HOME/WORK/ZKN/INBOX/note-$(date +%Y%m%d).md"
if [ ! -f $noteFilename ]; then
  echo "# Notes for $(date +%Y-%m-%d)" > $noteFilename
fi
cd "$HOME/WORK/ZKN/INBOX"
    nvim -c "norm Go" \
    -c "norm Go## $(date +%Y%m%d%H%M)" \
    -c "norm G2o" \
    -c "norm zz" \
    -c "startinsert" $noteFilename

