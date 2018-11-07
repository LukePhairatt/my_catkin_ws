/*
 *  Copyright (c) 2017, Nagoya University
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  * Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 *  * Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 *  * Neither the name of Autoware nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 *  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 *  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 *  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 *  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 *  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 *  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 *  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Created by amc on 2017-11-15.
//
*/
#include <string>
#include <vector>
#include <ros/ros.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/image_encodings.h>
#include <sensor_msgs/CameraInfo.h>

#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/calib3d/calib3d.hpp"

#include "opencv2/opencv.hpp"

#define _NODE_NAME_ "image_rectifier"

class RosImageRectifierApp

{
	ros::Subscriber     subscriber_image_raw_;
	ros::Subscriber     subscriber_image_jpg_;
	ros::Subscriber     subscriber_intrinsics_;

	ros::Publisher      publisher_image_rectified_;

	cv::Size            image_size_;
	cv::Mat             camera_instrinsics_;
	cv::Mat             distortion_coefficients_;
	std::string 				distortion_model_;
	std::string 				cv_window_name_;


	void ImageCallback(const sensor_msgs::Image& in_image_sensor)
	{		
		//Receive Image, convert it to OpenCV Mat
		cv_bridge::CvImagePtr cv_image = cv_bridge::toCvCopy(in_image_sensor, "bgr8");
		cv::Mat tmp_image = cv_image->image;
		PubUndistortedImage(tmp_image, in_image_sensor.header);

	}
	
	void ImageCallbackCompressed(const sensor_msgs::CompressedImageConstPtr& in_image_sensor)
	{		
		//Convert compressed image data to cv::Mat
		cv::Mat tmp_image = cv::imdecode(cv::Mat(in_image_sensor->data),1);
		PubUndistortedImage(tmp_image, in_image_sensor->header);

	}

	void IntrinsicsCallback(const sensor_msgs::CameraInfo& in_message)
	{
		image_size_.height = in_message.height;
		image_size_.width = in_message.width;
    distortion_model_ = in_message.distortion_model;
		camera_instrinsics_ = cv::Mat(3,3, CV_64F);
		for (int row=0; row<3; row++) {
			for (int col=0; col<3; col++) {
				camera_instrinsics_.at<double>(row, col) = in_message.K[row * 3 + col];
			}
		}

    // Different coeff dimension
    int dim = (distortion_model_ == "fish_eye") ? 4:5;

    distortion_coefficients_ = cv::Mat(1,dim,CV_64F);
    for (int col=0; col<dim; col++) {
      distortion_coefficients_.at<double>(col) = in_message.D[col];
    }
	}
	
	
	void PubUndistortedImage(const cv::Mat& image_src, std_msgs::Header header_src)
	{
		cv::Size s = image_src.size();
		uint32_t width = s.width;
		uint32_t height = s.height; 
		// undistorted image pub
	  cv::Mat image;
	  
		if (camera_instrinsics_.empty() || distortion_model_.empty())
		{
			// TODO: should this return nothing (no publishing), we don't want distorted image to work with?
			ROS_INFO("[%s] Make sure camera_info is being published in the specified topic", _NODE_NAME_);
			image = image_src;
		}
		else
		{
			// apply fisheye or standard model
			if(distortion_model_ == "fish_eye")
			{
        // *this doesn't work
        //cv::fisheye::undistortImage(tmp_image, image, camera_instrinsics_, distortion_coefficients_);

        cv::Mat newCamMat, map1, map2;
        cv::Size imageSize(width, height);
        // *remap works 
        
        //cv::fisheye::estimateNewCameraMatrixForUndistortRectify(camera_instrinsics_, distortion_coefficients_, imageSize, cv::Matx33d::eye(), newCamMat, 1);
        //cv::fisheye::initUndistortRectifyMap(camera_instrinsics_, distortion_coefficients_, cv::Matx33d::eye(), newCamMat, imageSize, CV_16SC2, map1, map2);
        //remap(image_src, image, map1, map2, cv::INTER_LINEAR);
        
        // *improve remap     
        newCamMat = cv::getOptimalNewCameraMatrix(camera_instrinsics_, distortion_coefficients_, imageSize, 0, imageSize, 0, true);   
        cv::fisheye::initUndistortRectifyMap(camera_instrinsics_, distortion_coefficients_, cv::Matx33d::eye(), newCamMat, imageSize, CV_16SC2, map1, map2);
        remap(image_src, image, map1, map2, cv::INTER_LINEAR); 
			}
			else
			{
				cv::undistort(image_src, image, camera_instrinsics_, distortion_coefficients_);
			}	
		}
		
		// publish															      
		cv_bridge::CvImage out_msg;
		out_msg.header   = header_src;                                      // copy header 
		out_msg.header.stamp = ros::Time::now();                            // new time stamp 
		out_msg.encoding = sensor_msgs::image_encodings::BGR8;
		out_msg.image    = image; // Your cv::Mat
		publisher_image_rectified_.publish(out_msg.toImageMsg());
		// imshow
		if(image_show_)
		{ 
			try
			{    
				//show undistorted image
				cv::imshow(cv_window_name_, image);
				cv::waitKey(10);
			}
			catch (cv_bridge::Exception& e)
			{
				ROS_ERROR("Could not convert to image!");
			}
		}	
	}

public:
	bool	image_show_;
	
	void Run()
	{
		ros::NodeHandle node_handle("~");//to receive args
		// camera info and image type subscribers
    std::string image_src_topic_str, camera_info_topic_str, image_rectified_str, image_type_str;
		std::string name_space_str = ros::this_node::getNamespace();

		node_handle.param<std::string>("image_type", image_type_str, "compressed");
		node_handle.param<std::string>("image_src", image_src_topic_str, "/image_raw");
    node_handle.param<std::string>("image_rectified", image_rectified_str, "/image_rectified");
		node_handle.param<std::string>("camera_info_src", camera_info_topic_str, "/camera_info");

		if (name_space_str != "/") {
			if (name_space_str.substr(0, 2) == "//") {
				/* if name space obtained by ros::this::node::getNamespace()
				   starts with "//", delete one of them */
				name_space_str.erase(name_space_str.begin());
			}
			image_src_topic_str = name_space_str + image_src_topic_str;
			image_rectified_str = name_space_str + image_rectified_str;
			camera_info_topic_str = name_space_str + camera_info_topic_str;
		}

		ROS_INFO("[%s] image_src: %s", _NODE_NAME_, image_src_topic_str.c_str());
		ROS_INFO("[%s] camera_info_src: %s", _NODE_NAME_, camera_info_topic_str.c_str());
		ROS_INFO("[%s] Subscribing to... %s", _NODE_NAME_, image_src_topic_str.c_str());
		if(image_type_str == "compressed")
		{
		  subscriber_image_jpg_ = node_handle.subscribe(image_src_topic_str, 1, &RosImageRectifierApp::ImageCallbackCompressed, this);
	  }
	  else
	  {
			subscriber_image_raw_ = node_handle.subscribe(image_src_topic_str, 1, &RosImageRectifierApp::ImageCallback, this);
	  }
		

		ROS_INFO("[%s] Subscribing to... %s", _NODE_NAME_, camera_info_topic_str.c_str());
		subscriber_intrinsics_ = node_handle.subscribe(camera_info_topic_str, 1, &RosImageRectifierApp::IntrinsicsCallback, this);

		publisher_image_rectified_ = node_handle.advertise<sensor_msgs::Image>(image_rectified_str, 1);
		ROS_INFO("[%s] Publishing Rectified image in %s", _NODE_NAME_, image_rectified_str.c_str());


		// cv image display
		node_handle.param<bool>("image_show", image_show_, false);
		cv_window_name_ = image_src_topic_str;
		if(image_show_)
		{
			cv::namedWindow(cv_window_name_);
			cv::startWindowThread();
	  }
	  
    // readym spin
		ROS_INFO("[%s] Ready. Waiting for data...", _NODE_NAME_);
		ros::spin();
		// exit
		ROS_INFO("[%s] END rect", _NODE_NAME_);
	}

	~RosImageRectifierApp()
	{
		if(image_show_)
		{
			cv::destroyWindow(cv_window_name_);
		}
	}

	RosImageRectifierApp()
	{	
	}
};

int main(int argc, char **argv)
{
  //std::cout << "OpenCV version : " << CV_VERSION << std::endl;
  //std::cout << "Major version : " << CV_MAJOR_VERSION << std::endl;
  //std::cout << "Minor version : " << CV_MINOR_VERSION << std::endl;
  //std::cout << "Subminor version : " << CV_SUBMINOR_VERSION << std::endl;
	ros::init(argc, argv, _NODE_NAME_);

	RosImageRectifierApp app;
	app.Run();

	return 0;
}
