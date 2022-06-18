# CAPE

If you are going to run it in docker then clone it and run

I changed CMakeLists.txt of CAPE original one. I added OpenCV library path in CMakeLists.txt. <br>
Repositoriy is in working mode
<br>
In order to display GUI do following commands before running:
<br>
```
xhost +

sudo docker run --rm -ti --net=host --ipc=host    -e DISPLAY=$DISPLAY    -v /tmp/.X11-unix:/tmp/.X11-unix Image_name
```

If you get error after running `xhost +` then do `export DISPLAY=:0.0` and then try again `xhost + `
<br>
After finishing all stuf run `xhost - `
