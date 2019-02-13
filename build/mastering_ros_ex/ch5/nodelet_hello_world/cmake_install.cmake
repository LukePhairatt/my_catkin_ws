# Install script for directory: /home/punnu/catkin_ws/src/mastering_ros_ex/ch5/nodelet_hello_world

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/punnu/catkin_ws/build/mastering_ros_ex/ch5/nodelet_hello_world/catkin_generated/installspace/nodelet_hello_world.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_hello_world/cmake" TYPE FILE FILES
    "/home/punnu/catkin_ws/build/mastering_ros_ex/ch5/nodelet_hello_world/catkin_generated/installspace/nodelet_hello_worldConfig.cmake"
    "/home/punnu/catkin_ws/build/mastering_ros_ex/ch5/nodelet_hello_world/catkin_generated/installspace/nodelet_hello_worldConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_hello_world" TYPE FILE FILES "/home/punnu/catkin_ws/src/mastering_ros_ex/ch5/nodelet_hello_world/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/nodelet_hello_world" TYPE DIRECTORY FILES "/home/punnu/catkin_ws/src/mastering_ros_ex/ch5/nodelet_hello_world/include/nodelet_hello_world/")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/nodelet_hello_world" TYPE FILE FILES
    "/home/punnu/catkin_ws/src/mastering_ros_ex/ch5/nodelet_hello_world/hello_world.xml"
    "/home/punnu/catkin_ws/src/mastering_ros_ex/ch5/nodelet_hello_world/hello_world.launch"
    )
endif()

