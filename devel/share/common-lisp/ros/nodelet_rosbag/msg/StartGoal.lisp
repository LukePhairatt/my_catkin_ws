; Auto-generated. Do not edit!


(cl:in-package nodelet_rosbag-msg)


;//! \htmlinclude StartGoal.msg.html

(cl:defclass <StartGoal> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass StartGoal (<StartGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nodelet_rosbag-msg:<StartGoal> is deprecated: use nodelet_rosbag-msg:StartGoal instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartGoal>) ostream)
  "Serializes a message object of type '<StartGoal>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartGoal>) istream)
  "Deserializes a message object of type '<StartGoal>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartGoal>)))
  "Returns string type for a message object of type '<StartGoal>"
  "nodelet_rosbag/StartGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartGoal)))
  "Returns string type for a message object of type 'StartGoal"
  "nodelet_rosbag/StartGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartGoal>)))
  "Returns md5sum for a message object of type '<StartGoal>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartGoal)))
  "Returns md5sum for a message object of type 'StartGoal"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartGoal>)))
  "Returns full string definition for message of type '<StartGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartGoal)))
  "Returns full string definition for message of type 'StartGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartGoal>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'StartGoal
))