;; Auto-generated. Do not edit!


(when (boundp 'nodelet_rosbag::StopResult)
  (if (not (find-package "NODELET_ROSBAG"))
    (make-package "NODELET_ROSBAG"))
  (shadow 'StopResult (find-package "NODELET_ROSBAG")))
(unless (find-package "NODELET_ROSBAG::STOPRESULT")
  (make-package "NODELET_ROSBAG::STOPRESULT"))

(in-package "ROS")
;;//! \htmlinclude StopResult.msg.html


(defclass nodelet_rosbag::StopResult
  :super ros::object
  :slots ())

(defmethod nodelet_rosbag::StopResult
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(setf (get nodelet_rosbag::StopResult :md5sum-) "d41d8cd98f00b204e9800998ecf8427e")
(setf (get nodelet_rosbag::StopResult :datatype-) "nodelet_rosbag/StopResult")
(setf (get nodelet_rosbag::StopResult :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

")



(provide :nodelet_rosbag/StopResult "d41d8cd98f00b204e9800998ecf8427e")

