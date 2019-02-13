;; Auto-generated. Do not edit!


(when (boundp 'robotnik_pp_msgs::ObjectDetected)
  (if (not (find-package "ROBOTNIK_PP_MSGS"))
    (make-package "ROBOTNIK_PP_MSGS"))
  (shadow 'ObjectDetected (find-package "ROBOTNIK_PP_MSGS")))
(unless (find-package "ROBOTNIK_PP_MSGS::OBJECTDETECTED")
  (make-package "ROBOTNIK_PP_MSGS::OBJECTDETECTED"))

(in-package "ROS")
;;//! \htmlinclude ObjectDetected.msg.html


(defclass robotnik_pp_msgs::ObjectDetected
  :super ros::object
  :slots (_front _back ))

(defmethod robotnik_pp_msgs::ObjectDetected
  (:init
   (&key
    ((:front __front) nil)
    ((:back __back) nil)
    )
   (send-super :init)
   (setq _front __front)
   (setq _back __back)
   self)
  (:front
   (&optional __front)
   (if __front (setq _front __front)) _front)
  (:back
   (&optional __back)
   (if __back (setq _back __back)) _back)
  (:serialization-length
   ()
   (+
    ;; bool _front
    1
    ;; bool _back
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _front
       (if _front (write-byte -1 s) (write-byte 0 s))
     ;; bool _back
       (if _back (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _front
     (setq _front (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _back
     (setq _back (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get robotnik_pp_msgs::ObjectDetected :md5sum-) "73a2bd721b4a3b8685cf760b8c3d9be8")
(setf (get robotnik_pp_msgs::ObjectDetected :datatype-) "robotnik_pp_msgs/ObjectDetected")
(setf (get robotnik_pp_msgs::ObjectDetected :definition-)
      "#Boolean variable, True if object has been detected
bool front
bool back

")



(provide :robotnik_pp_msgs/ObjectDetected "73a2bd721b4a3b8685cf760b8c3d9be8")


