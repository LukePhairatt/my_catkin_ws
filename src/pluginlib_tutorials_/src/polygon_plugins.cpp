#include <pluginlib/class_list_macros.h>                 //PLUGINLIB_EXPORT_CLASS
#include <pluginlib_tutorials_/polygon_base.h>           //Plugin class
#include <pluginlib_tutorials_/polygon_plugins.h>        //Plugin class



PLUGINLIB_EXPORT_CLASS(polygon_plugins::Triangle, polygon_base::RegularPolygon)
PLUGINLIB_EXPORT_CLASS(polygon_plugins::Square, polygon_base::RegularPolygon)
