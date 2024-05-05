# 尖锐物体检测 
astra_s: 奥比中光SDK\
datasets: 尖锐物体数据集/coco128（yolov5原始数据集）\
Results: yolov5尖锐物体识别训练结果\
yolov5: 训练模型与相关配置文件

# 奥比中光SDK安装方法 
本项目使用奥比中光Astra S作为尖锐物体检测相机，在ROS2中进行配置，SDK系统配置方法如下：\
参考奥比中光官网：https://vcp.developer.orbbec.com.cn/resourceCenter
## step1:安装驱动，ubuntu系统可省略

### 创建ROS2工作空间
```
mkdir -p ~/astra_s/src
cd ~/astra_s/src
```
## step3:下载OpenNI SDK安装包
下载OpenNI_SDK_ROS2_v1.0.2_20220809_b32e47_linux.tar.gz

### 在src中解压缩
```
tar -zxvf OpenNI_SDK_ROS2_v1.0.2_20220809_b32e47_linux.tar.gz -C src
```
## step4:安装依赖
```
sudo apt install libgflags-dev nlohmann-json3-dev ros-foxy-image-transport ros-foxy-image-publisher
```
### 安装glog
```
cd ~/astra_s
wget -c https://github.com/google/glog/archive/refs/tags/v0.6.0.tar.gz  -O glog-0.6.0.tar.gz
tar -xzvf glog-0.6.0.tar.gz
cd glog-0.6.0
mkdir build && cd build
cmake .. && make -j6
sudo make install
sudo ldconfig
```

### 安装magic_enum
```
cd ~/astra_s
wget -c https://github.com/Neargye/magic_enum/archive/refs/tags/v0.8.2.tar.gz -O  magic_enum-0.8.2.tar.gz
tar -xzvf magic_enum-0.8.2.tar.gz
cd magic_enum-0.8.2
mkdir build && cd build
cmake .. && make -j6
sudo make install
sudo ldconfig
```
### 安装libuvc
```
cd ~/astra_s
git clone https://github.com/libuvc/libuvc.git
cd libuvc
mkdir build && cd build
cmake .. && make -j6
sudo make install
sudo ldconfig
```
## step5:编译安装ros_astra_camera
### 处理libusb的规则
```
cd ~/astra_s/src/ros2_astra_camera/astra_camera/scripts
sudo bash install.h
sudo udevadm control --reload-rules && sudo udevadm trigger
```
### 开始编译
```
cd ~/astra_s
colcon build --event-handlers  console_direct+  --cmake-args  -DCMAKE_BUILD_TYPE=Release
```
# 相机SDK安装后测试相机驱动
## step1: 使环境生效
```
source ~/astra_s/install/setup.bash
```
## step2: 启动相机节点
```
ros2 launch astra_camera astra_mini.launch.py
```
# 读取相机RGB图像
### 默认的SDK包安装后无法读取彩色图像，若需要读取，打开 ~/astra_s/src/ros2_astra_camera/astra_camera/params/astra_mini_params.yaml文件修改第六行改为true即可在rviz2中的/image_raw中查看彩色图像，需要注意将三个policy都改为System Defult不然会显示No Image
### 注意，修改完yaml文件后需要重新编译
```
cd ~/astra_s
colcon build --event-handlers console_direct+ --cmake-args -DCMAKE_BUILD_TYPE=Release
```
