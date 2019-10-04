xhost +si:localuser:root
docker run -it --name cartographer_mapping --rm   \
       -v $(pwd):/mnt --workdir=/mnt \
	   -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	   -v /usr/lib/nvidia-418:/usr/lib/nvidia-418 \
	   -v /usr/lib32/nvidia-418:/usr/lib32/nvidia-418 \
       --net host \
       --privileged     \
	   -e DISPLAY=$DISPLAY \
       --env="LANG=ja_JP.UTF-8" \
			 --env QT_X11_NO_MITSHM=1 \
       cartographer /bin/bash 
		
