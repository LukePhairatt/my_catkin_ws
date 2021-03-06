;; Auto-generated. Do not edit!


(when (boundp 'robotnik_pp_msgs::GoToGoal)
  (if (not (find-package "ROBOTNIK_PP_MSGS"))
    (make-package "ROBOTNIK_PP_MSGS"))
  (shadow 'GoToGoal (find-package "ROBOTNIK_PP_MSGS")))
(unless (find-package "ROBOTNIK_PP_MSGS::GOTOGOAL")
  (make-package "ROBOTNIK_PP_MSGS::GOTOGOAL"))

(in-package "ROS")
;;//! \htmlinclude GoToGoal.msg.html


(defclass robotnik_pp_msgs::GoToGoal
  :super ros::object
  :slots (_target ))

(defmethod robotnik_pp_msgs::GoToGoal
  (:init
   (&key
    ((:target __target) (let (r) (dotimes (i 0) (push (instance robotnik_pp_msgs::goal :init) r)) r))
    )
   (send-super :init)
   (setq _target __target)
   self)
  (:target
   (&rest __target)
   (if (keywordp (car __target))
       (send* _target __target)
     (progn
       (if __target (setq _target (car __target)))
       _target)))
  (:serialization-length
   ()
   (+
    ;; robotnik_pp_msgs/goal[] _target
    (apply #'+ (send-all _target :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; robotnik_pp_msgs/goal[] _target
     (write-long (length _target) s)
     (dolist (elem _target)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; robotnik_pp_msgs/goal[] _target
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _target (let (r) (dotimes (i n) (push (instance robotnik_pp_msgs::goal :init) r)) r))
     (dolist (elem- _target)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get robotnik_pp_msgs::GoToGoal :md5sum-) "5c7eeba8aff53a215446e596e2937594")
(setf (get robotnik_pp_msgs::GoToGoal :datatype-) "robotnik_pp_msgs/GoToGoal")
(setf (get robotnik_pp_msgs::GoToGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Define the goal
goal[] target

================================================================================
MSG: robotnik_pp_msgs/goal
# Position 
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



(provide :robotnik_pp_msgs/GoToGoal "5c7eeba8aff53a215446e596e2937594")


