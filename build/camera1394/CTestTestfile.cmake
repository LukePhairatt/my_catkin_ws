# CMake generated Testfile for 
# Source directory: /home/punnu/catkin_ws/src/camera1394
# Build directory: /home/punnu/catkin_ws/build/camera1394
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_camera1394_rostest_tests_no_device_node.test "/home/punnu/catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/punnu/catkin_ws/build/test_results/camera1394/rostest-tests_no_device_node.xml" "--return-code" "/opt/ros/kinetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/punnu/catkin_ws/src/camera1394 --package=camera1394 --results-filename tests_no_device_node.xml --results-base-dir \"/home/punnu/catkin_ws/build/test_results\" /home/punnu/catkin_ws/src/camera1394/tests/no_device_node.test ")
add_test(_ctest_camera1394_rostest_tests_no_device_nodelet.test "/home/punnu/catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/punnu/catkin_ws/build/test_results/camera1394/rostest-tests_no_device_nodelet.xml" "--return-code" "/opt/ros/kinetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/punnu/catkin_ws/src/camera1394 --package=camera1394 --results-filename tests_no_device_nodelet.xml --results-base-dir \"/home/punnu/catkin_ws/build/test_results\" /home/punnu/catkin_ws/src/camera1394/tests/no_device_nodelet.test ")
subdirs(src/nodes)
