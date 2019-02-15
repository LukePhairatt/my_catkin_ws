cmake_minimum_required(VERSION 2.8.3)
project(twist_vehicle_cmd)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

find_package(autoware_msgs REQUIRED)

find_package(catkin REQUIRED COMPONENTS
        roscpp
        sensor_msgs
		geometry_msgs
		autoware_msgs
        )

catkin_package(CATKIN_DEPENDS
        sensor_msgs
 		geometry_msgs
		autoware_msgs
        )

###########
## Build ##
###########

include_directories(
        ${catkin_INCLUDE_DIRS}
		${autoware_msgs_INCLUDE_DIRS}
        include
)

SET(CMAKE_CXX_FLAGS "-O2 -g -Wall ${CMAKE_CXX_FLAGS}")

#Image rectifier
add_executable(twist_vehicle_mapper
        nodes/twist_vehicle_mapper.cpp
        )

add_dependencies(twist_vehicle_mapper 
        ${catkin_EXPORTED_TARGETS}
        )

target_link_libraries(twist_vehicle_mapper
        ${catkin_LIBRARIES}
        )

#############
## Install ##
#############

install(TARGETS twist_vehicle_mapper
        ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
        )

