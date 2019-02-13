#!/usr/bin/env python
import rosbag
import yaml
from sensor_msgs.msg import CameraInfo

use_msg_stamp=False

def get_cam_info(yaml_fname):
    # Load data from file
    with open(yaml_fname, "r") as file_handle:
        calib_data = yaml.load(file_handle)
    # Parse
    camera_info_msg = CameraInfo()
    camera_info_msg.width = calib_data["image_width"]
    camera_info_msg.height = calib_data["image_height"]
    camera_info_msg.K = calib_data["camera_matrix"]["data"]
    camera_info_msg.D = calib_data["distortion_coefficients"]["data"]
    camera_info_msg.R = calib_data["rectification_matrix"]["data"]
    camera_info_msg.P = calib_data["projection_matrix"]["data"]
    camera_info_msg.distortion_model = calib_data["distortion_model"]
    print(camera_info_msg)
    return camera_info_msg

if __name__ == '__main__':

    topic = "/gmsl_camera_0_0/camera_info"
    msg = get_cam_info("/home/om0007/AVP/avp_ws/src/image_processor/calib/camera_0_0.yaml")
    msg.header.frame_id = "camera_0_0"
    info_00 = (topic, msg)

    topic = "/gmsl_camera_0_1/camera_info"
    msg = get_cam_info("/home/om0007/AVP/avp_ws/src/image_processor/calib/camera_0_1.yaml")
    msg.header.frame_id = "camera_0_1"
    info_01 = (topic, msg)

    msg = get_cam_info("/home/om0007/AVP/avp_ws/src/image_processor/calib/camera_0_2.yaml")
    topic = "/gmsl_camera_0_2/camera_info"
    msg.header.frame_id = "camera_0_2"
    info_02 = (topic, msg)

    topic = "/gmsl_camera_0_3/camera_info"
    msg = get_cam_info("/home/om0007/AVP/avp_ws/src/image_processor/calib/camera_0_3.yaml")
    msg.header.frame_id = "camera_0_3"
    info_03 = (topic, msg)

    topic = "/gmsl_camera_1_0/camera_info"
    msg = get_cam_info("/home/om0007/AVP/avp_ws/src/image_processor/calib/camera_1_0.yaml")
    msg.header.frame_id = "camera_1_0"
    info_10 = (topic, msg)

    topic = "/gmsl_camera_1_1/camera_info"
    msg = get_cam_info("/home/om0007/AVP/avp_ws/src/image_processor/calib/camera_1_1.yaml")
    msg.header.frame_id = "camera_1_1"
    info_11 = (topic, msg)

    topic = "/gmsl_camera_1_2/camera_info"
    msg = get_cam_info("/home/om0007/AVP/avp_ws/src/image_processor/calib/camera_1_2.yaml")
    msg.header.frame_id = "camera_1_2"
    info_12 = (topic, msg)

    topic = "/gmsl_camera_1_3/camera_info"
    msg = get_cam_info("/home/om0007/AVP/avp_ws/src/image_processor/calib/camera_1_3.yaml")
    msg.header.frame_id = "camera_1_3"
    info_13 = (topic, msg)


    with rosbag.Bag('/mnt/RaidStorage/om0007/Data/AVP/CarParks/ParkoPedia/05.09.18GuilfordSurrey/Processed_NewP_GFD_2018-09-05-12-19-47-imu-top.bag', 'w') as outbag:
        for topic, msg, t in rosbag.Bag('/mnt/RaidStorage/om0007/Data/AVP/CarParks/ParkoPedia/05.09.18GuilfordSurrey/GFD_2018-09-05-12-19-47-imu-top.bag').read_messages():

            # Use stamp from msg, or bag?
            # Doesn't seem to work, so set to false.
            if use_msg_stamp:
                t = (msg.header.stamp if msg._has_header else t)

            if topic == "/gmsl_image_raw_0_0":
                topic = "/gmsl_camera_0_0/image_raw"
                msg.header.frame_id = "camera_0_0"
                outbag.write(topic, msg, t)
                info_00[1].header.stamp = msg.header.stamp
                outbag.write(info_00[0],info_00[1],t)
            elif topic == "/gmsl_image_raw_0_1":
                topic = "/gmsl_camera_0_1/image_raw"
                msg.header.frame_id = "camera_0_1"
                outbag.write(topic, msg, t)
                info_01[1].header.stamp = msg.header.stamp
                outbag.write(info_01[0], info_01[1], t)
            elif topic == "/gmsl_image_raw_0_2":
                topic = "/gmsl_camera_0_2/image_raw"
                msg.header.frame_id = "camera_0_2"
                outbag.write(topic, msg, t)
                info_02[1].header.stamp = msg.header.stamp
                outbag.write(info_02[0], info_02[1], t)
            elif topic == "/gmsl_image_raw_0_3":
                topic = "/gmsl_camera_0_3/image_raw"
                msg.header.frame_id = "camera_0_3"
                outbag.write(topic, msg, t)
                info_03[1].header.stamp = msg.header.stamp
                outbag.write(info_03[0], info_03[1], t)
            elif topic == "/gmsl_image_raw_1_0":
                topic = "/gmsl_camera_1_0/image_raw"
                msg.header.frame_id = "camera_1_0"
                outbag.write(topic, msg, t)
                info_10[1].header.stamp = msg.header.stamp
                outbag.write(info_10[0], info_10[1], t)
            elif topic == "/gmsl_image_raw_1_1":
                topic = "/gmsl_camera_1_1/image_raw"
                msg.header.frame_id = "camera_1_1"
                outbag.write(topic, msg, t)
                info_11[1].header.stamp = msg.header.stamp
                outbag.write(info_11[0], info_11[1], t)
            elif topic == "/gmsl_image_raw_1_2":
                topic = "/gmsl_camera_1_2/image_raw"
                msg.header.frame_id = "camera_1_2"
                outbag.write(topic, msg, t)
                info_12[1].header.stamp = msg.header.stamp
                outbag.write(info_12[0], info_12[1], t)
            elif topic == "/gmsl_image_raw_1_3":
                topic = "/gmsl_camera_1_3/image_raw"
                msg.header.frame_id = "camera_1_3"
                outbag.write(topic, msg, t)
                info_13[1].header.stamp = msg.header.stamp
                outbag.write(info_13[0], info_13[1], t)
            else:
                outbag.write(topic, msg, t)