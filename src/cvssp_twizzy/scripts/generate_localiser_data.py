#!/usr/bin/env python
import rospy

import math
import tf2_py
from tf import transformations as t
import tf2_ros
import geometry_msgs
import tf2_geometry_msgs

import sys
import rospy
import cv2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError

class image_converter:

  def __init__(self):

    self.bridge = CvBridge()
    self.image_sub = rospy.Subscriber("image_topic",Image,self.callback)

    #    self.image_pub = rospy.Publisher("image_topic_2",Image)

    self.tfBuffer = tf2_ros.Buffer()
    self.listener = tf2_ros.TransformListener(self.tfBuffer)
    self.broadcaster = tf2_ros.StaticTransformBroadcaster()

    self.map_frame = rospy.get_param('~map_frame', 'map')

  def callback(self,data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)

    (rows,cols,channels) = cv_image.shape

    cv2.imshow("Image window", cv_image)
    cv2.waitKey(3)

    try:
        trans = self.tfBuffer.lookup_transform(self.map_frame, data.header.frame_id, rospy.Time(0))
    except (tf2_ros.LookupException):
        print("ERROR: LookupException!")
        return
    except (tf2_ros.ConnectivityException):
        print("ERROR: ConnectivityException!")
        return
    except (tf2_ros.ExtrapolationException):
        print("ERROR: ExtrapolationException!")
        return

    #try:
    #  self.image_pub.publish(self.bridge.cv2_to_imgmsg(cv_image, "bgr8"))
    #except CvBridgeError as e:
    #  print(e)

if __name__ == '__main__':
    rospy.init_node('twizzy_pose_to_tf')

    im_sub = image_converter()

    rospy.spin()