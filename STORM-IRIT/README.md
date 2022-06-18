# Plane-Detection-Point-Cloud

#### Process 3D point clouds

To process any point cloud given as a PLY file `mycloud.ply` (OBJ files are handled as well), first run the following commands to preprocess the data
```
pdpcComputeMultiScaleFeatures -v -i mycloud.ply -o mycloud
pdpcSegmentation -v -i mycloud.ply -s mycloud_scales.txt -f mycloud_features.txt -o mycloud
``` 
The first program `pdpcComputeMultiScaleFeatures` computes surface curvatures and normals from the point cloud at multiple scales.
The second program `pdpcSegmentation` performs planar region growings at all scales. 
Note that an oriented normal vector is required for each input point. 

Finally, the program `pdpcPostProcess` can perform 3 different operations depending on the given options
```
pdpcPostProcess -v -i mycloud.ply -s mycloud_seg.txt -c mycloud_comp.txt -o results1 -range 0 9 10 19 20 29 30 39 40 49 
pdpcPostProcess -v -i mycloud.ply -s mycloud_seg.txt -c mycloud_comp.txt -o results2 -pers 10 15 20 25 30 35 40
pdpcPostProcess -v -i mycloud.ply -s mycloud_seg.txt -c mycloud_comp.txt -o results3 -scales 5 10 15 20 25 30 35
```
- `-range birth1 death1 birth2 death2` generates two files showing components that persist in the scale ranges (`birth1`,`death1`) and (`birth2`,`death2`)
- `-pers pers1 pers2` generates two files showing components that are more persistent than the persistence thresholds `pers1` and `pers2`
- `-scale scale1 scale2` generates two files showing the most persistent components that include the scale thresholds `scale1` and `scale2`

Results are generated as text files with one integer per line corresponding to one label per point (where `-1` means that the point is unlabeled). 
Add the option `-col` so that the colored PLY files are also generated. 
To modify some parameters please check the help of the programs by running them with the option `-h`.

Original repo: https://github.com/STORM-IRIT/Plane-Detection-Point-Cloud
