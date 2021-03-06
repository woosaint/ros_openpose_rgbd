#!/usr/bin/bash

# Example of usage:
# https://askubuntu.com/questions/648603/how-to-create-an-animated-gif-from-mp4-video-via-command-line
# sudo apt-get install ffmpeg

ulimit -Sv 5000000
ffmpeg \
    -i demo_with_hand.mp4 \
    -r 1 \
    -vf scale=1024:-1 \
    -ss 00:00:00 -to 00:00:37 \
    tmptmp.gif

# Speed up.
# http://blog.floriancargoet.com/slow-down-or-speed-up-a-gif-with-imagemagick/
convert -delay 10x100 tmptmp.gif tmp.gif

# The output gif is compressed.
# The only defect is that the output framerate cannot be adjusted.

# You may try this tool to compress the gif again.
# sudo apt install gifsicle
gifsicle -i tmp.gif -O3 --colors 128 -o demo_with_hand.gif
