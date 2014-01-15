#!/bin/bash
# Script for converting images

FROM_W=1920
FROM_H=1080

TO_W=1280
TO_H=720

# Image conversion 1080
for f in `find images/${FROM_H} -type f`; do
  fo="`echo $f | sed -e \"s|/${FROM_H}/|/${TO_H}/|\"`";
  RES="`identify $f 2>/dev/null | cut -d' ' -f3`";
  RES_X="`echo ${RES} | cut -d'x' -f1`"
  RES_Y="`echo ${RES} | cut -d'x' -f2`"

  FIN_X=$((RES_X*TO_W/FROM_W))
  FIN_Y=$((RES_Y*TO_H/FROM_H))

  mkdir -p `dirname $fo`;
  convert $f -resize ${FIN_X}x${FIN_Y}\! $fo;
  echo $fo;
done
