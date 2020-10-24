#!/bin/sh

rm -r results/
sudo docker run --rm --volume $(pwd):/doc/ latex-g7-32
