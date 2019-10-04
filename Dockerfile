FROM ros:kinetic

LABEL com.nvidia.volumes.needed="nvidia_driver"
ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

ENV DEBIAN_FRONTEND noninteractive
ENV USER root

COPY cartographer_ros_with_vlp16.rosinstall .

#RUN apt-get update
#RUN apt-get install -y tmux
#RUN apt-get install -y ipython
#RUN apt-get install -y python
#RUN apt-get install -y git tmux wget tar vim
#RUN apt-get install -y ipython python python-pip
#RUN apt-get install -y libeigen3-dev
#RUN apt-get install -y libboost-all-dev
#RUN apt-get install -y rviz
#RUN apt-get install -y python-wstool python-rosdep ninja-build

#RUN mkdir -p /root/git/
#RUN git clone https://github.com/RyuYamamoto/haze_setting /root/git/haze_setting/
#RUN cp /root/git/haze_setting/tmux/tmux.conf ~/.tmux.conf

#RUN mkdir -p ~/catkin_ws/src
#RUN cd ~/catkin_ws/
#RUN wstool init src
#RUN wstool merge -t src
#https://raw.githubusercontent.com/googlecartographer/cartographer_ros/master/cartographer_ros.rosinstall
#RUN wstool update -t src
#RUN src/cartographer/scripts/install_proto3.sh
#RUN sudo rosdep init
#RUN rosdep update
#RUN rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
#RUN bash -c "source /opt/ros/kinetic/setup.bash && catkin_make_isolated --install --install-space=/opt/ros/${ROS_DISTRO} --use-ninja"
#RUN catkin_make_isolated --install --use-ninja

RUN echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
RUN echo "export PATH="/usr/lib/nvidia-418/bin":${PATH}" >> ~/.bashrc
RUN echo "export LD_LIBRARY_PATH="/usr/lib/nvidia-418:/usr/lib32/nvidia-418":${LD_LIBRARY_PATH}" >> ~/.bashrc
