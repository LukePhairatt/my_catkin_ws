; Auto-generated. Do not edit!


(cl:in-package nodelet_rosbag-msg)


;//! \htmlinclude StartFeedback.msg.html

(cl:defclass <StartFeedback> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:integer
    :initform 0))
)

(cl:defclass StartFeedback (<StartFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nodelet_rosbag-msg:<StartFeedback> is deprecated: use nodelet_rosbag-msg:StartFeedback instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <StartFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nodelet_rosbag-msg:status-val is deprecated.  Use nodelet_rosbag-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartFeedback>) ostream)
  "Serializes a message object of type '<StartFeedback>"
  (cl:let* ((signed (cl:slot-value msg 'status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartFeedback>) istream)
  "Deserializes a message object of type '<StartFeedback>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartFeedback>)))
  "Returns string type for a message object of type '<StartFeedback>"
  "nodelet_rosbag/StartFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartFeedback)))
  "Returns string type for a message object of type 'StartFeedback"
  "nodelet_rosbag/StartFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartFeedback>)))
  "Returns md5sum for a message object of type '<StartFeedback>"
  "86791dcf1de997ec7de5a0de7e4dcfcc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartFeedback)))
  "Returns md5sum for a message object of type 'StartFeedback"
  "86791dcf1de997ec7de5a0de7e4dcfcc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartFeedback>)))
  "Returns full string definition for message of type '<StartFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%int32 status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartFeedback)))
  "Returns full string definition for message of type 'StartFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%int32 status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartFeedback>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'StartFeedback
    (cl:cons ':status (status msg))
))
