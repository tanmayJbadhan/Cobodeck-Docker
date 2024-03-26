# Use dorowu/ubuntu-desktop-lxde-vnc:bionic-lxqt as the base image
FROM dorowu/ubuntu-desktop-lxde-vnc:bionic-lxqt

# Avoid user interaction with apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Add the ROS repository and key
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
    && sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Install ROS Melodic, python-rosdep, and initialize rosdep
RUN apt-get update \
    && apt-get install -y ros-melodic-desktop-full \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Install rosdep
RUN apt-get update && apt-get install -y python-rosdep \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Initialize rosdep
RUN rosdep init \
    && rosdep update

# Setup the ROS environment
RUN echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc

# Set the default command to execute when creating a new container
CMD ["bash"]

