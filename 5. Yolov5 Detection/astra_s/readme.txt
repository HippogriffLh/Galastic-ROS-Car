####### 相机SDK安装后测试相机驱动 #######
# step1: 使环境生效
source ~/astra_s/install/setup.bash
# step2: 启动相机节点
ros2 launch astra_camera astra_mini.launch.py

####### 读取相机RGB图像 #######
# 默认的SDK包安装后无法读取彩色图像，若需要读取，打开 ~/astra_s/src/ros2_astra_camera/astra_camera/params/astra_mini_params.yaml文件修改第六行改为true即可在rviz2中的/image_raw中查看彩色图像，需要注意将三个policy都改为System Defult不然会显示No Image
# 注意，修改完yaml文件后需要重新编译
cd ~/astra_s
colcon build --event-handlers console_direct+ --cmake-args -DCMAKE_BUILD_TYPE=Release
