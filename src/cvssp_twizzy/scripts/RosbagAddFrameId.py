#!/usr/bin/env python
import rosbag

use_msg_stamp=False

with rosbag.Bag('/mnt/RaidStorage/om0007/Data/AVP/CarParks/SurreyUni/Guilford/Cropped_Framed_InfoFixed_2018-09-18-18-01-24.bag', 'w') as outbag:
    for topic, msg, t in rosbag.Bag('/mnt/RaidStorage/om0007/Data/AVP/CarParks/SurreyUni/Guilford/Cropped_2018-09-18-18-01-24.bag').read_messages():

        # Use stamp from msg, or bag?
        # Doesn't seem to work, so set to false.
        if use_msg_stamp:
            t = (msg.header.stamp if msg._has_header else t)

        if topic == "/camera_info_00":
            topic = "/gmsl_camera_0_0/camera_info"
            msg.header.frame_id = "camera_0_0"
            #outbag.write(topic, msg, t)
            info_00 = (topic,msg)
        elif topic == "/camera_info_01":
            topic = "/gmsl_camera_0_1/camera_info"
            msg.header.frame_id = "camera_0_1"
            #outbag.write(topic, msg, t)
            info_01 = (topic, msg)
        elif topic == "/camera_info_02":
            topic = "/gmsl_camera_0_2/camera_info"
            msg.header.frame_id = "camera_0_2"
            #outbag.write(topic, msg, t)
            info_02 = (topic, msg)
        elif topic == "/camera_info_03":
            topic = "/gmsl_camera_0_3/camera_info"
            msg.header.frame_id = "camera_0_3"
            #outbag.write(topic, msg, t)
            info_03 = (topic, msg)
        elif topic == "/camera_info_10":
            topic = "/gmsl_camera_1_0/camera_info"
            msg.header.frame_id = "camera_1_0"
            #outbag.write(topic, msg, t)
            info_10 = (topic, msg)
        elif topic == "/camera_info_11":
            topic = "/gmsl_camera_1_1/camera_info"
            msg.header.frame_id = "camera_1_1"
            #outbag.write(topic, msg, t)
            info_11 = (topic, msg)
        elif topic == "/camera_info_12":
            topic = "/gmsl_camera_1_2/camera_info"
            msg.header.frame_id = "camera_1_2"
            #outbag.write(topic, msg, t)
            info_12 = (topic, msg)
        elif topic == "/camera_info_13":
            topic = "/gmsl_camera_1_3/camera_info"
            msg.header.frame_id = "camera_1_3"
            #outbag.write(topic, msg, t)
            info_13 = (topic, msg)
        elif topic == "/gmsl_image_raw_0_0":
            topic = "/gmsl_camera_0_0/image_raw"
            msg.header.frame_id = "camera_0_0"
            outbag.write(topic, msg, t)
            if 'info_00' in locals():
                info_00[1].header.stamp = msg.header.stamp
                outbag.write(info_00[0],info_00[1],t)
        elif topic == "/gmsl_image_raw_0_1":
            topic = "/gmsl_camera_0_1/image_raw"
            msg.header.frame_id = "camera_0_1"
            outbag.write(topic, msg, t)
            if 'info_01' in locals():
                info_01[1].header.stamp = msg.header.stamp
                outbag.write(info_01[0], info_01[1], t)
        elif topic == "/gmsl_image_raw_0_2":
            topic = "/gmsl_camera_0_2/image_raw"
            msg.header.frame_id = "camera_0_2"
            outbag.write(topic, msg, t)
            if 'info_02' in locals():
                info_02[1].header.stamp = msg.header.stamp
                outbag.write(info_02[0], info_02[1], t)
        elif topic == "/gmsl_image_raw_0_3":
            topic = "/gmsl_camera_0_3/image_raw"
            msg.header.frame_id = "camera_0_3"
            outbag.write(topic, msg, t)
            if 'info_03' in locals():
                info_03[1].header.stamp = msg.header.stamp
                outbag.write(info_03[0], info_03[1], t)
        elif topic == "/gmsl_image_raw_1_0":
            topic = "/gmsl_camera_1_0/image_raw"
            msg.header.frame_id = "camera_1_0"
            outbag.write(topic, msg, t)
            if 'info_10' in locals():
                info_10[1].header.stamp = msg.header.stamp
                outbag.write(info_10[0], info_10[1], t)
        elif topic == "/gmsl_image_raw_1_1":
            topic = "/gmsl_camera_1_1/image_raw"
            msg.header.frame_id = "camera_1_1"
            outbag.write(topic, msg, t)
            if 'info_11' in locals():
                info_11[1].header.stamp = msg.header.stamp
                outbag.write(info_11[0], info_11[1], t)
        elif topic == "/gmsl_image_raw_1_2":
            topic = "/gmsl_camera_1_2/image_raw"
            msg.header.frame_id = "camera_1_2"
            outbag.write(topic, msg, t)
            if 'info_12' in locals():
                info_12[1].header.stamp = msg.header.stamp
                outbag.write(info_12[0], info_12[1], t)
        elif topic == "/gmsl_image_raw_1_3":
            topic = "/gmsl_camera_1_3/image_raw"
            msg.header.frame_id = "camera_1_3"
            outbag.write(topic, msg, t)
            if 'info_13' in locals():
                info_13[1].header.stamp = msg.header.stamp
                outbag.write(info_13[0], info_13[1], t)
        else:
            outbag.write(topic, msg, t)