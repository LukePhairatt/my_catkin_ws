/*
  Copyright 2016 Lucas Walter
*/

#include "rqt_plugin_cpp/my_plugin.h"
#include <pluginlib/class_list_macros.h>
#include <QStringList>
#include <QtGui>


namespace rqt_plugin_cpp
{

MyPlugin::MyPlugin(): rqt_gui_cpp::Plugin(), widget_(0)
{
  // Constructor is called first before initPlugin function, needless to say.

  // give QObjects reasonable names
  setObjectName("MyPlugin");
}

void MyPlugin::initPlugin(qt_gui_cpp::PluginContext& context)
{
  // std::cout << "Init plugin ...[DONE]" << std::endl;
  // access standalone command line arguments
  QStringList argv = context.argv();
  // create QWidget
  widget_ = new QWidget();
  // extend the widget with all attributes and children from UI file
  ui_.setupUi(widget_);
  // add widget to the user interface
  context.addWidget(widget_);
  // this will make toggle work
  ui_.startMaster->setCheckable(true);
  ui_.exitMaster->setCheckable(true);
  ui_.recordBag->setCheckable(true);
  ui_.stopBag->setCheckable(true);
  // add gui event connection
  connect(ui_.startMaster, SIGNAL(toggled(bool)), this, SLOT(startMaster()));
  connect(ui_.exitMaster, SIGNAL(toggled(bool)), this, SLOT(exitMaster()));
  connect(ui_.recordBag, SIGNAL(toggled(bool)), this, SLOT(recordBag()));
  connect(ui_.stopBag, SIGNAL(toggled(bool)), this, SLOT(stopBag()));

}

void MyPlugin::shutdownPlugin()
{
  // unregister all publishers here
}

void MyPlugin::saveSettings(qt_gui_cpp::Settings& plugin_settings, qt_gui_cpp::Settings& instance_settings) const
{
  // instance_settings.setValue(k, v)
}

void MyPlugin::restoreSettings(const qt_gui_cpp::Settings& plugin_settings, const qt_gui_cpp::Settings& instance_settings)
{
  // v = instance_settings.value(k)
}

/*bool hasConfiguration() const
{
  return true;
}

void triggerConfiguration()
{
  // Usually used to open a dialog to offer the user a set of configuration
}*/

void MyPlugin::startMaster()
{
  QProcess process;
  //need absolute path
  process.startDetached("xterm", QStringList()<<"/home/punnu/catkin_ws/src/rqt_plugin/rqt_plugin_cpp/resources/scripts/carpark_mapping_launch.sh");
}

void MyPlugin::exitMaster()
{
  //stop devices

  //stop ros rqt_gui and roscore
  //system("killall -9 rosmaster");  // hard way
  system("pkill -f /opt/ros");       // gentle way


}

void MyPlugin::stopBag()
{
  system("rosnode kill rosbag_record");
}

void MyPlugin::recordBag()
{
  QProcess process;
  //need absolute path
  process.startDetached("xterm", QStringList()<<"/home/punnu/catkin_ws/src/rqt_plugin/rqt_plugin_cpp/resources/scripts/data_record_launch.sh");
}




}  // namespace rqt_plugin_cpp
PLUGINLIB_DECLARE_CLASS(rqt_plugin_cpp, MyPlugin, rqt_plugin_cpp::MyPlugin, rqt_gui_cpp::Plugin)
