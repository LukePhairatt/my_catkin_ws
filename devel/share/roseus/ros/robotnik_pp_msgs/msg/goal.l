;; Auto-generated. Do not edit!


(when (boundp 'robotnik_pp_msgs::goal)
  (if (not (find-package "ROBOTNIK_PP_MSGS"))
    (make-package "ROBOTNIK_PP_MSGS"))
  (shadow 'goal (find-package "ROBOTNIK_PP_MSGS")))
(unless (find-package "ROBOTNIK_PP_MSGS::GOAL")
  (make-package "ROBOTNIK_PP_MSGS::GOAL"))

(in-package "ROS")
;;//! \htmlinclude goal.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass robotnik_pp_msgs::goal
  :super ros::object
  :slots (_pose _speed ))

(defmethod robotnik_pp_msgs::goal
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose2D :init))
    ((:speed __speed) 0.0)
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _speed (float __speed))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _pose
    (send _pose :serialization-length)
    ;; float32 _speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _pose
       (send _pose :serialize s)
     ;; float32 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float32 _speed
     (setq _speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robotnik_pp_msgs::goal :md5sum-) "0e0e8dfef329b7a976daedf203ce03b5")
(setf (get robotnik_pp_msgs::goal :datatype-) "robotnik_pp_msgs/goal")
(setf (get robotnik_pp_msgs::goal :definition-)
      "# Position 
geometry_msgs/Pose2D pose
# Desired speed
float32 speed

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta

")



(provide :robotnik_pp_msgs/goal "0e0e8dfef329b7a976daedf203ce03b5")


