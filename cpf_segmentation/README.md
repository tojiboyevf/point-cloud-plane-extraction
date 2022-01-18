# Instruction
## Options of building the docker image of repo:

1) You can build docker image using current `Dockerfile` in this directory. But before running dockerfile you have to change the location of the some folders and files. The script `runbeforedocker.sh` does everything for you. Then build docker image:
```
docker build -t cpf_segmentation:1.0 .
```



Then finally after creating docker image run following command:

```sudo docker run --rm -ti --privileged --net=host --ipc=host    -e DISPLAY=$DISPLAY    -v /tmp/.X11-unix,/tmp/.X11-unix  --mount src=/pathOfInputFolder,target=/app/build/input,type=bind --mount src=/pathOfOutputFolder,target=/app/build/output,type=bind cpf_segmentation:1.0```

Here `src=/pathOfInputFolder` means the path of dataset that you are going to test and `src=/pathOfOutputFolder` means the path of output folder that you are going to store the result. For example:
```
sudo docker run --rm -ti --privileged --net=host --ipc=host    -e DISPLAY=$DISPLAY    -v /tmp/.X11-unix,/tmp/.X11-unix  --mount src=/home/adminlinux/cpf_segmentation/input,target=/app/build/input,type=bind --mount src=/home/adminlinux/cpf_segmentation/output,target=/app/build/output,type=bind cpf_segmentation:1.0
```
2) Or you can run ready docker image `tojiboyevf/cpf_segmentation:1.0`

## Testing repo:

If you are using docker image by default the path of working directory will be in `build` folder.

To test the library, use following general command:

```
pathOfBuildDirectory/segmentation_test pathOfDataset/data.pcd -o outputFolderPath/nameOfOutputfile
```
For example, in docker image you can run:
```
./segmentation_test input/0000.pcd -o output/0000_result
```
`-o` is response to save the result to indicated path after it. You can omit it if you are not going to save the result.  
The name of output file starts with `0000_result` and you can find it in `output` folder. Be sure you pasted dataset in `input` folder.
There is an additonal parameter `-novis`. If you use it then it doesn't visualize the result. For example:
```
./segmentation_test input/0000.pcd -o output/result -novis
```



# cpf_segmentation
C++ library for unsupervised segmentation of 3D points via Constrained Plane Fitting.

To compile and use the library go to the src folder and

```
mkdir build
cd build
cmake ..
make
sudo make install
```

Make sure that $LD_LIBRARY_PATH is pointing to the install folder (/usr/local/lib by default).

To verify that everyting is set up properly use

```
pkg-config --list-all | grep segmentation
```

To test the library, run

```
./segmentation_test ../test_data/tum_small.pcd
```

If you want to cite this work, you can use the bibtex entry below

```
@inproceedings{Pham2016,
abstract = {Modern SLAM systems with a depth sensor are
able to reliably reconstruct dense 3D geometric maps of indoor
scenes. Representing these maps in terms of meaningful entities
is a step towards building semantic maps for autonomous
robots. One approach is to segment the 3D maps into semantic
objects using Conditional Random Fields (CRF), which requires
large 3D ground truth datasets to train the classification
model. Additionally, the CRF inference is often computationally
expensive. In this paper, we present an unsupervised geometricbased
approach for the segmentation of 3D point clouds into
objects and meaningful scene structures. We approximate an
input point cloud by an adjacency graph over surface patches,
whose edges are then classified as being either on or off. We
devise an effective classifier which utilises both global planar
surfaces and local surface convexities for edge classification.
More importantly, we propose a novel global plane extraction
algorithm for robustly discovering the underlying planes in the
scene. Our algorithm is able to enforce the extracted planes
to be mutually orthogonal or parallel which conforms usually
with human-made indoor environments. We reconstruct 654 3D
indoor scenes from NYUv2 sequences to validate the efficiency
and effectiveness of our segmentation method.
},
author = {Pham, Trung T. and Eich, Markus and Reid, Ian and Wyeth, Gordon}
booktitle = {2016 IEEE/RSJ International Conference on Intelligent Robots and Systems, IROS},
month = {October},
pages = {},
publisher = {IEEE},
title = {{Geometrically Consistent Plane Extraction for Dense Indoor 3D Maps Segmentation}},
year = {2016}
}
```
