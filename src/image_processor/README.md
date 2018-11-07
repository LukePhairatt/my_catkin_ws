# Compressed Image Rectifier
This node 

- decodes "sensor_msgs/CompressedImage" image type and publish undistorted image "sensor_msgs::Image" type 

  ​	Note: frame rate will be lower on this message format 

- apply image undistortion based on the camera distortion model defined in a camera info for each camera using opencv function

  ​	Note: "plum blob" or "fisheye" 

- display undistorted image(s) by setting  <arg name="imshow" default="true" />

Build: catkin_make

Run:

- play rosbag with camera info included
- roslaunch image_processor image_rectifier_gmsl_hd.launch