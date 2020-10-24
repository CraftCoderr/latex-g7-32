#!/bin/sh

rm -r results/
sudo docker run --rm --volume $(pwd):/doc/tex/ latex-g7-32
