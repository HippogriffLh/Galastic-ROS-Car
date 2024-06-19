# Detection
参考百度网盘中的yolov5文件，百度网盘链接：https://pan.baidu.com/s/1Wzc2VRJiIwLHN6dmdiISGQ?pwd=nhxx 

## 1.测试所用设备
能够支持UVC协议的相机均可直接接入电脑使用基于yolov5的尖锐物体检测算法\
在本项目中使用杰锐微通电子科技有限公司的单目相机，具体型号见下：\
型号：HF868-2\
POWER：USB5V\
PIXEL SIZE：1080P

## 2.算法的启动与训练
训练好的模型文件地址是" \yolov5_detection\models\sharpObj_yolov5s.yaml"\
启动文件路径"\yolov5_detection\sharpObj_detect.py"，需要检测可连接支持UVC相机直接运行sharpObj_detect.py文件\
训练文件路径“ \yolov5_detection\sharpObj_train.py”，若需要加入新的数据集进行训练可以直接按照dataset文件中的图片和标签格式加入，而后运行sharpObj_train.py文件即可训练。

## 关于yolov5如何部署与使用可以参考网址：
https://blog.csdn.net/m0_55317949/article/details/125268136
