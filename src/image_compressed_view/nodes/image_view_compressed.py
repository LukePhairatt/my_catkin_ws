#!/usr/bin/env python
import sys, time
# numpy and scipy
import numpy as np
from scipy.ndimage import filters
# OpenCV
import cv2
# Ros libraries
import roslib
import rospy

# Ros Messages
from sensor_msgs.msg import CompressedImage
# We do not use cv_bridge it does not support CompressedImage in python
# from cv_bridge import CvBridge, CvBridgeError

VERBOSE=True

def get_param(name, default):
    try:
        v = rospy.get_param(name)
        rospy.loginfo("Found parameter: %s, value: %s" % (name, str(v)))
    except KeyError:
        v = default
        rospy.logwarn("Cannot find value for parameter: %s, assigning "
                      "default: %s" % (name, str(v)))
    return v


class image_viewer:

    def __init__(self):
        '''Initialize ros subscriber'''
        self.img_topic = get_param('~img_topic','')

        # subscribed Topic
        if self.img_topic:
            # callback subscriber
            self.subscriber = rospy.Subscriber(self.img_topic, CompressedImage, self.callback,  queue_size = 5)
            if VERBOSE:
                print "subscribed to: ",self.img_topic
            
            
    def callback(self, ros_data):
        '''Callback function of subscribed topic. 
        Here images get converted and features detected'''
        #### direct conversion to CV2 ####
        np_arr = np.fromstring(ros_data.data, np.uint8)
        image_np = cv2.imdecode(np_arr, cv2.IMREAD_COLOR)
        # display
        cv2.namedWindow(self.img_topic,cv2.WINDOW_NORMAL)
        cv2.resizeWindow(self.img_topic, 640,480)
        cv2.imshow(self.img_topic, image_np)
        cv2.waitKey(2)

def main(args):
    '''Initializes and cleanup ros node'''
    rospy.init_node('image_viewer_compressed', anonymous=True)
    ic = image_viewer()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print "Shutting down ROS Image feature detector module"
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main(sys.argv)



