# Install script for directory: /home/punnu/catkin_ws/src/robotnik_purepursuit_planner/robotnik_pp_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/punnu/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_pp_msgs/msg" TYPE FILE FILES
    "/home/punnu/catkin_ws/src/robotnik_purepursuit_planner/robotnik_pp_msgs/msg/goal.msg"
    "/home/punnu/catkin_ws/src/robotnik_purepursuit_planner/robotnik_pp_msgs/msg/ObjectDetected.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_pp_msgs/action" TYPE FILE FILES "/home/punnu/catkin_ws/src/robotnik_purepursuit_planner/robotnik_pp_msgs/action/GoTo.action")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_pp_msgs/msg" TYPE FILE FILES
    "/home/punnu/catkin_ws/devel/share/robotnik_pp_msgs/msg/GoToAction.msg"
    "/home/punnu/catkin_ws/devel/share/robotnik_pp_msgs/msg/GoToActionGoal.msg"
    "/home/punnu/catkin_ws/devel/share/robotnik_pp_msgs/msg/GoToActionResult.msg"
    "/home/punnu/catkin_ws/devel/share/robotnik_pp_msgs/msg/GoToActionFeedback.msg"
    "/home/punnu/catkin_ws/devel/share/robotnik_pp_msgs/msg/GoToGoal.msg"
    "/home/punnu/catkin_ws/devel/share/robotnik_pp_msgs/msg/GoToResult.msg"
    "/home/punnu/catkin_ws/devel/share/robotnik_pp_msgs/msg/GoToFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_pp_msgs/cmake" TYPE FILE FILES "/home/punnu/catkin_ws/build/robotnik_purepursuit_planner/robotnik_pp_msgs/catkin_generated/installspace/robotnik_pp_msgs-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/include/robotnik_pp_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/share/roseus/ros/robotnik_pp_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/share/common-lisp/ros/robotnik_pp_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/share/gennodejs/ros/robotnik_pp_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/punnu/catkin_ws/devel/lib/python2.7/dist-packages/robotnik_pp_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/lib/python2.7/dist-packages/robotnik_pp_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/punnu/catkin_ws/build/robotnik_purepursuit_planner/robotnik_pp_msgs/catkin_generated/installspace/robotnik_pp_msgs.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_pp_msgs/cmake" TYPE FILE FILES "/home/punnu/catkin_ws/build/robotnik_purepursuit_planner/robotnik_pp_msgs/catkin_generated/installspace/robotnik_pp_msgs-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_pp_msgs/cmake" TYPE FILE FILES
    "/home/punnu/catkin_ws/build/robotnik_purepursuit_planner/robotnik_pp_msgs/catkin_generated/installspace/robotnik_pp_msgsConfig.cmake"
    "/home/punnu/catkin_ws/build/robotnik_purepursuit_planner/robotnik_pp_msgs/catkin_generated/installspace/robotnik_pp_msgsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/robotnik_pp_msgs" TYPE FILE FILES "/home/punnu/catkin_ws/src/robotnik_purepursuit_planner/robotnik_pp_msgs/package.xml")
endif()

