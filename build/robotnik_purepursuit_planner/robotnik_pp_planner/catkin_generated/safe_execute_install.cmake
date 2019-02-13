execute_process(COMMAND "/home/punnu/catkin_ws/build/robotnik_purepursuit_planner/robotnik_pp_planner/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/punnu/catkin_ws/build/robotnik_purepursuit_planner/robotnik_pp_planner/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
