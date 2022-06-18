#!/bin/bash

set -ex

mkdir -p ../../output/fig_05
../build/pdpcPostProcess -i ../../input/triangles.ply -s ../../output/data_triangles_seg.txt -c ../../output/data_triangles_comp.txt -o ../../output/fig_05/fig_05 -col -v -range 20 24 25 30 40 42
