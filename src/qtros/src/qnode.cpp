/**
 * @file /src/qnode.cpp
 *
 * @brief Ros communication central!
 *
 * @date February 2011
 **/

/*****************************************************************************
** Includes
*****************************************************************************/

#include <ros/ros.h>
#include <ros/network.h>
#include <ros/master.h>
#include <string>
#include <std_msgs/String.h>
#include <sstream>
#include "../include/qtros/qnode.hpp"

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace qtros {

/*****************************************************************************
** Implementation
*****************************************************************************/

QNode::QNode(int argc, char** argv ):init_argc(argc),init_argv(argv)
{
}

QNode::~QNode() {
    if(ros::isStarted()) {
      ros::shutdown(); // explicitly needed since we use ros::start();
      ros::waitForShutdown();
    }
	wait();
}

bool QNode::init() {
	ros::init(init_argc,init_argv,"qtros");
  ros::Time::init();
  while (!ros::master::check())
  {
     std::cout << "waiting..." << std::endl;
     ros::Duration(0.5).sleep();
  }

  if ( !ros::master::check() ) {
		return false;
	}
  else
  {
    return true;
  }

  // Don't want to run any ROS comm here
	ros::start(); // explicitly needed since our nodehandle is going out of scope.
  ros::NodeHandle n;
	// Add your ros communications here.
  // chatter_publisher = n.advertise<std_msgs::String>("chatter", 1000);
	start();
	return true;
}


void QNode::log( const LogLevel &level, const std::string &msg) {
	logging_model.insertRows(logging_model.rowCount(),1);
	std::stringstream logging_model_msg;
	switch ( level ) {
		case(Debug) : {
				ROS_DEBUG_STREAM(msg);
				logging_model_msg << "[DEBUG] [" << ros::Time::now() << "]: " << msg;
				break;
		}
		case(Info) : {
				ROS_INFO_STREAM(msg);
				logging_model_msg << "[INFO] [" << ros::Time::now() << "]: " << msg;
				break;
		}
		case(Warn) : {
				ROS_WARN_STREAM(msg);
				logging_model_msg << "[INFO] [" << ros::Time::now() << "]: " << msg;
				break;
		}
		case(Error) : {
				ROS_ERROR_STREAM(msg);
				logging_model_msg << "[ERROR] [" << ros::Time::now() << "]: " << msg;
				break;
		}
		case(Fatal) : {
				ROS_FATAL_STREAM(msg);
				logging_model_msg << "[FATAL] [" << ros::Time::now() << "]: " << msg;
				break;
		}
	}
	QVariant new_row(QString(logging_model_msg.str().c_str()));
	logging_model.setData(logging_model.index(logging_model.rowCount()-1),new_row);
	Q_EMIT loggingUpdated(); // used to readjust the scrollbar
}

void QNode::stopbag()
{
  //kill ros node
  //TODO passing with node argument
  system("rosnode kill rosbag_record");
}

void QNode::systemShutdown()
{
  //shutdown ros and exit gui
  if(ros::master::check())
  {
    //shut down this node
    ros::shutdown();
    ros::waitForShutdown();
    //shut down rosmaster and/or roscore
    system("killall -9 rosmaster");
    //shut down gui
    Q_EMIT rosShutdown(); // used to signal the gui for a shutdown
  }
  else
  {
    std::cout << "Ros shutdown fail!" << std::endl;
  }
}

}  // namespace qtros
