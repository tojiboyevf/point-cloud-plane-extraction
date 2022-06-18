# PEAC

After building docker image run this commands in order to be able to run executable file:
```
xhost +

sudo docker run --rm -ti --privileged --net=host --ipc=host    -e DISPLAY=$DISPLAY    -v /tmp/.X11-unix,/tmp/.X11-unix  --mount src=/home/adminlinux/PEAC/input,target=/app/build/input,type=bind --mount src=/home/adminlinux/PEAC/output,target=/app/build/output,type=bind Image_name

```
Then in build directory just run `./plane_fitter_pcd `

Original repo: https://github.com/ai4ce/peac
