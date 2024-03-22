#!/usr/bin/env bash

sketchybar --set $NAME label="$(curl 'wttr.in/MexicoCity?format=%c%f')"
