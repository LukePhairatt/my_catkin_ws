#include "ros/ros.h"
#include "std_msgs/String.h"

#include <sstream>
#include <signal.h>
#include "dummy_thread.hpp"

#include <boost/thread/mutex.hpp>


#include <iostream>
#include <map>
#include <iterator>
#include <string>



namespace test_op
{
  typedef std::pair<std::string, std::string> option_test;	
}

typedef std::pair<std::string, std::string> option_t;
static bool volatile running = true;
boost::mutex mutex_lock;

class DeviceArguments 
{
	public:
	  DeviceArguments(const std::vector<option_t>& options)
	  {
		  // init arguments
		  for(auto& option: options)
		  {
			  arguments.insert(option);
		  }
	  }
	  
	  void printArguments()
	  {
		for(auto arg: arguments)
		{
			std::cout << arg.first << "    " << arg.second << std::endl;
		}
	  }
	  
	 const std::string& get(const char *name) const
	 {
       auto it = arguments.find(name);
       if (it == arguments.end()) 
       {
          printf("Get error: Missing device argument '%s' requested\n", name);
          return empty_string;
       } 
       else
       {
         return it->second;
	   }
     }
     
     bool set(const char* name, std::string new_value) 
     {
		 auto it = arguments.find(name);
		 if (it == arguments.end()) 
         {
            printf("Set error: Missing argument '%s' requested\n", name);
            return false;
         }
         else
         {
			arguments[name] =  new_value;
			return true;
		 }
	 }
	  
	  
	 private:
	    std::map<std::string, std::string> arguments;
	    const std::string empty_string = {}; 	
};


static void signalHandler(int signum)
{
	std::cout << "Interrupt signal (" << signum << ") received.\n";
	boost::mutex::scoped_lock lock(mutex_lock);
	running = false;
	ros::shutdown();
}


// Default hardware configuration options
std::vector<option_t> options =
{
  // making pair camera config key:value
  std::make_pair("type_ab", "ar0231-rccb"),
  std::make_pair("type_cd", "ar0231-rccb"),
  std::make_pair("type_ef", "ar0231-rccb"),
  std::make_pair("selector_mask", "11110001"),
  std::make_pair("cross_csi_sync", "0"),
  std::make_pair("fifo_size", "3"),
  std::make_pair("slave", "0"),
};


std::vector<test_op::option_test> options_test =
{
  // making pair camera config key:value
  std::make_pair("type_ab", "ar0231-rccb"),
  std::make_pair("type_cd", "ar0231-rccb"),
  std::make_pair("type_ef", "ar0231-rccb"),
  std::make_pair("selector_mask", "11110001"),
  std::make_pair("cross_csi_sync", "0"),
  std::make_pair("fifo_size", "3"),
  std::make_pair("slave", "0"),
};


DeviceArguments CameraArguments(options);


void initSensor(DeviceArguments& CameraArguments)
{
  std::cout << "Init Sensors .. " << std::endl;
  std::string selector = CameraArguments.get("selector_mask");
  // identify active camera in each port
  int idx             = 0;
  int cnt[3]          = {0, 0, 0};
  std::string port[3] = {"ab", "cd", "ef"};
  for (size_t i = 0; i < selector.length() && i < 12; i++, idx++) 
  {
	const char s = selector[i];
	if (s == '1') 
	{
	  cnt[idx / 4]++;
    }
  }	
  
  // Debug 
  std::cout << "Active camera per port- ABC order" << std::endl;
  std::cout << cnt[0] << " " << cnt[1] << " " << cnt[2] << std::endl;
  
  // how many cameras selected in a port
  for (size_t p = 0; p < 3; p++) 
  {
    if (cnt[p] > 0) 
    {
      std::string params;
	  params += std::string("csi-port=") + port[p];
      params += ",camera-type=" + CameraArguments.get((std::string("type_") + port[p]).c_str());
      params += ",camera-count=4"; // when using the mask, just ask for all cameras, mask will select properly
      
      if (selector.size() >= p*4) 
      {
        params += ",camera-mask="+ selector.substr(p*4, std::min(selector.size() - p*4, size_t{4}));
      }
      
      params += ",slave="  + CameraArguments.get("slave");
      params += ",cross-csi-sync="  + CameraArguments.get("cross_csi_sync");
      params += ",fifo-size="  + CameraArguments.get("fifo_size");
      
      std::cout << "Param: " << p << " : " << params.c_str() << std::endl;
      
 
    }
  }	
}




/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */
int main(int argc, char **argv)
{	
	
   CameraArguments.printArguments();	
  /**
   * The ros::init() function needs to see argc and argv so that it can 
   * perform any ROS arguments and name remapping that were provided at
   * the command line. For programmatic remappings you can use a
   * different version of init() which takes remappings directly, but
   * for most command-line programs, passing argc and argv is the easiest
   * way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any
   * other part of the ROS system.
   */
   ros::init(argc, argv, "talker");

   
   
  /**
   * NodeHandle is the main access point to communications with the
   * ROS system. The first NodeHandle constructed will fully initialize
   * this node, and the last NodeHandle destructed will close down
   * the node.
   */
   ros::NodeHandle n;
   ros::NodeHandle nh("~");
   
  /**
   * Device configuration
   */
   
   // showing global param + casting uint
   int width_param = 1024;
   n.getParam("/talker_node/width", width_param);
   // showing private param + casting uint
   int width_param_nh = 2049;
   nh.getParam("width", width_param_nh);
   int height_param_nh = 0;
   nh.param("height", height_param_nh, int(2000));
   

   std::cout << "width = " << (uint32_t)width_param << std::endl;
   std::cout << "width nh = " << (uint32_t)width_param_nh << std::endl;
   std::cout << "height nh = " << (uint32_t)height_param_nh << std::endl;
   
   // vector param (doesn't work)
   XmlRpc::XmlRpcValue cam_topics;
   nh.getParam("/cam_topics", cam_topics);
   ROS_ASSERT(cam_topics.getType() == XmlRpc::XmlRpcValue::TypeArray);
   for (int32_t i = 0; i < cam_topics.size(); ++i) 
	 {
		 std::cout << cam_topics[i] << "  " << std::endl;
	 }
	 
	 XmlRpc::XmlRpcValue cam_infos;
   nh.getParam("/cam_infos", cam_infos);
   ROS_ASSERT(cam_infos.getType() == XmlRpc::XmlRpcValue::TypeArray);
   for (int32_t i = 0; i < cam_infos.size(); ++i) 
	 {
		 std::cout << cam_infos[i] << "  " << std::endl;
	 }
   
   // load yaml params and put into vector instead
   std::string cam_topic1;
   nh.getParam("/image_topics/data", cam_topic1);
   std::cout << "YAML value:" << cam_topic1  << std::endl;
   
   XmlRpc::XmlRpcValue param_list;
	if( !nh.getParam("/param_name", param_list) )
	{
	  ROS_ERROR("Still failed...");
	}
	
	ROS_ASSERT(param_list.getType() == XmlRpc::XmlRpcValue::TypeArray);
  for (int32_t i = 0; i < param_list.size(); ++i) 
	{
		std::cout << param_list[i] << "  " << std::endl;
	} 
   
   
   // change default values from the launch file
   std::string type_ab_value = "";
   std::string type_cd_value = "";
   std::string type_ef_value = "";
   std::string selector_mask_value = "";
   std::string cross_csi_sync_value = "";
   std::string fifo_size_value = "";
   std::string slave_value = "";
   
   nh.param<std::string>("type_ab", type_ab_value,"ar0231");
   nh.param<std::string>("type_cd", type_cd_value,"ar0231");
   nh.param<std::string>("type_ef", type_ef_value,"ar0231");
   nh.param<std::string>("selector_mask", selector_mask_value,"0011");
   nh.param<std::string>("cross_csi_sync", cross_csi_sync_value,"0");
   nh.param<std::string>("fifo_size", fifo_size_value,"3");
   nh.param<std::string>("slave", slave_value,"0");
   
   
   std::cout << "Parsing param = " << type_ab_value << std::endl;
   std::cout << "Parsing param = " << selector_mask_value << std::endl;
   
   CameraArguments.set("type_ab", type_ab_value);
   CameraArguments.set("type_cd", type_cd_value);
   CameraArguments.set("type_ef", type_ef_value);
   CameraArguments.set("selector_mask", selector_mask_value);
   CameraArguments.set("cross_csi_sync", cross_csi_sync_value);
   CameraArguments.set("fifo_size", fifo_size_value);
   CameraArguments.set("slave", slave_value);
   
   // Debug- get value
   //std::string selector = CameraArguments.get("selector-mask");
   //std::cout << "Number of camera = " << selector.length() << std::endl;
   initSensor(CameraArguments);
   
   
  /**
   * The advertise() function is how you tell ROS that you want to
   * publish on a given topic name. This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing. After this advertise() call is made, the master
   * node will notify anyone who is trying to subscribe to this topic name,
   * and they will in turn negotiate a peer-to-peer connection with this
   * node.  advertise() returns a Publisher object which allows you to
   * publish messages on that topic through a call to publish().  Once
   * all copies of the returned Publisher object are destroyed, the topic
   * will be automatically unadvertised.
   *
   * The second parameter to advertise() is the size of the message queue
   * used for publishing messages.  If messages are published more quickly
   * than we can send them, the number here specifies how many messages to
   * buffer up before throwing some away.
   */
   ros::Publisher chatter_pub = n.advertise<std_msgs::String>("chatter", 10);

   ros::Rate loop_rate(10);

  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
   int count = 0;
   
   signal(SIGINT, signalHandler); //detect ctrl-c
   
   
  // dummy thread
  dummy_thread one_thread;
  one_thread.run();
  //

  while (running & ros::ok())
  {
   
    std_msgs::String msg;

    std::stringstream ss;
    ss << "hello world " << count << " running: " << running << std::endl;
    msg.data = ss.str();

    ROS_INFO("%s", msg.data.c_str());


    chatter_pub.publish(msg);
    
    ros::spinOnce();

    loop_rate.sleep();
    ++count;
  }
  
  std::cout << "Thread joinable = " << one_thread.joinable() << std::endl;
  
  one_thread.stop();
  std::cout << "exit.. " << std::endl;
  return 0;
}
