#!/bin/sh

rm -r results/
docker run --rm --volume $(pwd):/doc/ latex-g7-32
