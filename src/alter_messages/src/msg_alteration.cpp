#include <ros/ros.h>
#include <std_msgs/String.h>
#include <sensor_msgs/Image.h>

#include <sstream>
#include <iostream>
#include <string>
#include <vector>



class TopicAlteration
{
public:
  TopicAlteration(){}

  ~TopicAlteration(){}

  void Run()
  {
    ros::NodeHandle nh("~");
    // publish topics
    nh.param<std::string>("pub_topic", pub_topic_,"gmsl_image_alt");
    publisher_  = nh.advertise<sensor_msgs::Image>(pub_topic_, 10);

    // subscribe topics
    nh.param<std::string>("sub_topic", sub_topic_,"gmsl_image_raw");
    // mod topics
    nh.param<std::string>("mod_frame_id", mod_data_,"gmsl_0");

    // call back subscribe
    subscriber_ = nh.subscribe(sub_topic_, 10, &TopicAlteration::ImageCallback, this);
    // spind sub - pub
    ros::spin();
  }


private:
  void ImageCallback(const sensor_msgs::Image& in_image_sensor)
  {
    // Make a local copy
    sensor_msgs::Image out_image_sensor = in_image_sensor;
    // Modify contents- add tf frame
    out_image_sensor.header.frame_id = mod_data_;
    // Republish
    publisher_.publish(out_image_sensor);
  }

private:
  ros::Subscriber subscriber_;
  ros::Publisher  publisher_;
  std::string mod_data_;
  std::string sub_topic_;
  std::string pub_topic_;

};



/**
 * This node alter a subscribe topic message and republish it another.
 */
int main(int argc, char **argv)
{	

  ros::init(argc, argv, "alteration_node");
  TopicAlteration alt;
  alt.Run();
  return 0;
}
