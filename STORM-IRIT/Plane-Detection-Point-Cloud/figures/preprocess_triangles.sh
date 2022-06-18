#!/bin/bash

set -ex

../build/pdpcComputeMultiScaleFeatures -i ../../input/triangles.ply -o ../../output/data_triangles -v
../build/pdpcSegmentation -i ../../input/triangles.ply -s ../../output/data_triangles_scales.txt -f ../../output/data_triangles_features.txt -o ../../output/data_triangles -v
