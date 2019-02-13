#!/usr/bin/env python  
import roslib
import rospy

import tf
import turtlesim.msg
from geometry_msgs.msg import Pose


class transform:
	def __init__(self, tran, rot, src_id, dst_id):
		self.tran = tran
		self.rot = rot
		self.src_id = src_id
		self.dst_id = dst_id


def read_poses(filename):
	print("Opening: {}".format(filename))
	f = open(filename,"r")
	tfs=[]
	for line in f:
		tokens = line.split(' ')
		tran = (float(tokens[3]),float(tokens[4]),float(tokens[5]))
		rot =  (float(tokens[6]),float(tokens[7]),float(tokens[8]))
		src_id = tokens[9]
		dst_id = tokens[10]
		T = transform(tran,rot,src_id,dst_id)
		tfs.append(T)
	f.close()

	return tfs

if __name__ == '__main__':
	rospy.init_node('AVP_TF_Broadcast')

	tfs = read_poses("/home/om0007/AVP/avp_ws/src/cvssp_twizzy/config/StreetDroneTfs.txt")
	br = tf.TransformBroadcaster()

	r = rospy.Rate(10)
	while not rospy.is_shutdown():
		for T in tfs:
			#print("T:[{}] R:[{}] S:[{}] D:[{}]".format(T.tran,T.rot,T.src_id,T.dst_id))
			br.sendTransform((T.tran[0], T.tran[1], T.tran[2]), tf.transformations.quaternion_from_euler(T.rot[0], T.rot[1], T.rot[2]),rospy.Time.now(),str(T.dst_id),str(T.src_id))
		r.sleep()
#rospy.spin()