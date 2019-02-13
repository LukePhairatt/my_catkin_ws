# run core
roscore

# start nodelet manager
rosrun nodelet nodelet manager __name:=nodelet_manager


# instance nodelet- Class "Hello"
rosrun nodelet nodelet load nodelet_hello_world/Hello nodelet_manager __name:=nodelet1
