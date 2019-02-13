#!/usr/bin/env python
import rosbag
import rospy

def msg_to_yaml(size, name, d, k, r, p):
    calmessage = (""
                  + "image_width: " + str(size[0]) + "\n"
                  + "image_height: " + str(size[1]) + "\n"
                  + "camera_name: " + name + "\n"
                  + "camera_matrix:\n"
                  + "  rows: 3\n"
                  + "  cols: 3\n"
                  + "  data: [" + ", ".join(["%8f" % i for i in k]) + "]\n"
                  + "distortion_model: " + ("plumb_bob" if len(d) > 4 else "fish_eye") + "\n"
                  + "distortion_coefficients:\n"
                  + "  rows: 1\n"
                  + "  cols: 5\n"
                  + "  data: [" + ", ".join(["%8f" % i for i in d]) + "]\n"
                  + "rectification_matrix:\n"
                  + "  rows: 3\n"
                  + "  cols: 3\n"
                  + "  data: [" + ", ".join(["%8f" % i for i in r]) + "]\n"
                  + "projection_matrix:\n"
                  + "  rows: 3\n"
                  + "  cols: 4\n"
                  + "  data: [" + ", ".join(["%8f" % i for i in p]) + "]\n"
                  + "")
    return calmessage

if __name__ == '__main__':
    rospy.init_node('YmlFromBag', anonymous=True)
    bag_name = rospy.get_param('~bag_name')
    info_topic = rospy.get_param('~info_topic')
    cam_id = rospy.get_param('~cam_id')

    for topic, msg, t in rosbag.Bag(bag_name).read_messages():
        if topic == info_topic:
            msg.header.frame_id = cam_id
            yaml_txt = msg_to_yaml((msg.width, msg.height), msg.header.frame_id, msg.D, msg.K, msg.R, msg.P)
            filename = msg.header.frame_id + ".yaml"
            file = open(filename, "w")
            file.write(yaml_txt)
            file.close()
            print(yaml_txt)
            exit()
