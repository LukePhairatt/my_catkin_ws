/*
 *     Display compressed image data type
 */

#include <ros/ros.h>
#include <opencv2/highgui/highgui.hpp>
#include <cv_bridge/cv_bridge.h>

void imageCallback(const sensor_msgs::CompressedImageConstPtr& msg)
{
  try
  {
		//convert compressed image data to cv::Mat
    cv::Mat image = cv::imdecode(cv::Mat(msg->data),1);
    //undistorted image
    
    //image show 
    cv::imshow("view", image);
    cv::waitKey(10);
    
    //publish image raw uncompress and undistorted
    
  }
  catch (cv_bridge::Exception& e)
  {
    ROS_ERROR("Could not convert to image!");
  }
}


int main(int argc, char **argv)
{
	//init ros node
  ros::init(argc, argv, "image_listener");
  ros::NodeHandle nh;
  //init opencv display
  cv::namedWindow("view");
  cv::startWindowThread();
  //subscribers
  std::string image_src_topic_;
  nh.param<std::string>("image_src", image_src_topic_, "/port_0/camera_0/image_raw/compressed");
  ros::Subscriber sub = nh.subscribe(image_src_topic_, 1, imageCallback);
  ros::spin();
  cv::destroyWindow("view");
}
