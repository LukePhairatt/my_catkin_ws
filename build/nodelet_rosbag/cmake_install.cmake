# Install script for directory: /home/punnu/catkin_ws/src/nodelet_rosbag

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag/action" TYPE FILE FILES
    "/home/punnu/catkin_ws/src/nodelet_rosbag/action/Subscribe.action"
    "/home/punnu/catkin_ws/src/nodelet_rosbag/action/Start.action"
    "/home/punnu/catkin_ws/src/nodelet_rosbag/action/Stop.action"
    "/home/punnu/catkin_ws/src/nodelet_rosbag/action/Record.action"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag/msg" TYPE FILE FILES
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/SubscribeAction.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/SubscribeActionGoal.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/SubscribeActionResult.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/SubscribeActionFeedback.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/SubscribeGoal.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/SubscribeResult.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/SubscribeFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag/msg" TYPE FILE FILES
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StartAction.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StartActionGoal.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StartActionResult.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StartActionFeedback.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StartGoal.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StartResult.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StartFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag/msg" TYPE FILE FILES
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StopAction.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StopActionGoal.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StopActionResult.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StopActionFeedback.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StopGoal.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StopResult.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/StopFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag/msg" TYPE FILE FILES
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/RecordAction.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/RecordActionGoal.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/RecordActionResult.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/RecordActionFeedback.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/RecordGoal.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/RecordResult.msg"
    "/home/punnu/catkin_ws/devel/share/nodelet_rosbag/msg/RecordFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag/cmake" TYPE FILE FILES "/home/punnu/catkin_ws/build/nodelet_rosbag/catkin_generated/installspace/nodelet_rosbag-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/include/nodelet_rosbag")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/share/roseus/ros/nodelet_rosbag")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/share/common-lisp/ros/nodelet_rosbag")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/share/gennodejs/ros/nodelet_rosbag")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/punnu/catkin_ws/devel/lib/python2.7/dist-packages/nodelet_rosbag")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/devel/lib/python2.7/dist-packages/nodelet_rosbag")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/punnu/catkin_ws/build/nodelet_rosbag/catkin_generated/installspace/nodelet_rosbag.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag/cmake" TYPE FILE FILES "/home/punnu/catkin_ws/build/nodelet_rosbag/catkin_generated/installspace/nodelet_rosbag-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag/cmake" TYPE FILE FILES
    "/home/punnu/catkin_ws/build/nodelet_rosbag/catkin_generated/installspace/nodelet_rosbagConfig.cmake"
    "/home/punnu/catkin_ws/build/nodelet_rosbag/catkin_generated/installspace/nodelet_rosbagConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag" TYPE FILE FILES "/home/punnu/catkin_ws/src/nodelet_rosbag/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnodelet_rosbag.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnodelet_rosbag.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnodelet_rosbag.so"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES "/home/punnu/catkin_ws/devel/lib/libnodelet_rosbag.so")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnodelet_rosbag.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnodelet_rosbag.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnodelet_rosbag.so"
         OLD_RPATH "/opt/ros/kinetic/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libnodelet_rosbag.so")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_rosbag" TYPE FILE FILES
    "/home/punnu/catkin_ws/src/nodelet_rosbag/nodelet_rosbag.xml"
    "/home/punnu/catkin_ws/src/nodelet_rosbag/nodelet_rosbag.launch"
    )
endif()

