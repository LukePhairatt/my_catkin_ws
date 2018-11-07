cmake_minimum_required(VERSION 2.8.3)
project(image_processor)

find_package(catkin REQUIRED COMPONENTS
        roscpp
        sensor_msgs
        cv_bridge
        )

catkin_package(CATKIN_DEPENDS
        sensor_msgs
        cv_bridge
        )

find_package(OpenCV REQUIRED)

###########
## Build ##
###########

include_directories(
        ${catkin_INCLUDE_DIRS}
        include
)

SET(CMAKE_CXX_FLAGS "-O2 -g -Wall ${CMAKE_CXX_FLAGS}")

#Image rectifier
add_executable(image_rectifier
        nodes/image_rectifier/image_rectifier_node.cpp
        )

target_include_directories(image_rectifier PRIVATE
        ${OpenCV_INCLUDE_DIR}
        )

target_link_libraries(image_rectifier
        ${catkin_LIBRARIES}
        ${OpenCV_LIBS}
        )

#############
## Install ##
#############

install(TARGETS image_rectifier
        ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
        RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
        )

install(FILES
        launch/image_rectifier_gmsl.launch
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
        )
