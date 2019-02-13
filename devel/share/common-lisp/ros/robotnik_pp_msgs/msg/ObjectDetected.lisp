; Auto-generated. Do not edit!


(cl:in-package robotnik_pp_msgs-msg)


;//! \htmlinclude ObjectDetected.msg.html

(cl:defclass <ObjectDetected> (roslisp-msg-protocol:ros-message)
  ((front
    :reader front
    :initarg :front
    :type cl:boolean
    :initform cl:nil)
   (back
    :reader back
    :initarg :back
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ObjectDetected (<ObjectDetected>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ObjectDetected>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ObjectDetected)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robotnik_pp_msgs-msg:<ObjectDetected> is deprecated: use robotnik_pp_msgs-msg:ObjectDetected instead.")))

(cl:ensure-generic-function 'front-val :lambda-list '(m))
(cl:defmethod front-val ((m <ObjectDetected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotnik_pp_msgs-msg:front-val is deprecated.  Use robotnik_pp_msgs-msg:front instead.")
  (front m))

(cl:ensure-generic-function 'back-val :lambda-list '(m))
(cl:defmethod back-val ((m <ObjectDetected>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robotnik_pp_msgs-msg:back-val is deprecated.  Use robotnik_pp_msgs-msg:back instead.")
  (back m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ObjectDetected>) ostream)
  "Serializes a message object of type '<ObjectDetected>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'front) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'back) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ObjectDetected>) istream)
  "Deserializes a message object of type '<ObjectDetected>"
    (cl:setf (cl:slot-value msg 'front) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'back) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ObjectDetected>)))
  "Returns string type for a message object of type '<ObjectDetected>"
  "robotnik_pp_msgs/ObjectDetected")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ObjectDetected)))
  "Returns string type for a message object of type 'ObjectDetected"
  "robotnik_pp_msgs/ObjectDetected")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ObjectDetected>)))
  "Returns md5sum for a message object of type '<ObjectDetected>"
  "73a2bd721b4a3b8685cf760b8c3d9be8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ObjectDetected)))
  "Returns md5sum for a message object of type 'ObjectDetected"
  "73a2bd721b4a3b8685cf760b8c3d9be8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ObjectDetected>)))
  "Returns full string definition for message of type '<ObjectDetected>"
  (cl:format cl:nil "#Boolean variable, True if object has been detected~%bool front~%bool back~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ObjectDetected)))
  "Returns full string definition for message of type 'ObjectDetected"
  (cl:format cl:nil "#Boolean variable, True if object has been detected~%bool front~%bool back~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ObjectDetected>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ObjectDetected>))
  "Converts a ROS message object to a list"
  (cl:list 'ObjectDetected
    (cl:cons ':front (front msg))
    (cl:cons ':back (back msg))
))
