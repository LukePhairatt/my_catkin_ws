/**
 * @file /src/main_window.cpp
 *
 * @brief Implementation for the qt gui.
 *
 * @date February 2011
 **/
/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui>
#include <QMessageBox>
#include <iostream>
#include "../include/qtros/main_window.hpp"

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace qtros {

using namespace Qt;

/*****************************************************************************
** Implementation [MainWindow]
*****************************************************************************/

MainWindow::MainWindow(int argc, char** argv, QWidget *parent): QMainWindow(parent), qnode(argc,argv)
{
	ui.setupUi(this); // Calling this incidentally connects all ui's triggers to on_...() callbacks in this class.
  QObject::connect(ui.actionAbout_Qt, SIGNAL(triggered(bool)), qApp, SLOT(aboutQt())); // qApp is a global variable for the application

	setWindowIcon(QIcon(":/images/icon.png"));
	ui.tab_manager->setCurrentIndex(0); // ensure the first tab is showing - qt-designer should have this already hardwired, but often loses it (settings?).
  QObject::connect(&qnode, SIGNAL(rosShutdown()), this, SLOT(close()));
}

MainWindow::~MainWindow() {}

/*****************************************************************************
** Implementation [Helper Slots]
*****************************************************************************/
void MainWindow::startButtonMaster() {
  QProcess process;
  //need absolute path
  process.startDetached("xterm", QStringList()<<"/home/punnu/catkin_ws/src/qtros/resources/scripts/carpark_mapping_launch.sh");
}

void MainWindow::showNoMasterMessage()
{
  QMessageBox msgBox;
  msgBox.setText("Couldn't find the ros master.");
  msgBox.exec();
  close();
}

/*****************************************************************************
** Implementation [Slots]
*****************************************************************************/
void MainWindow::on_button_startmaster_clicked()
{
  //start roscore and devices
  startButtonMaster();
  //start ros gui node
  if(!qnode.init())
  {
    std::cout << "ROSMASTER NOT FOUND: qtros node init FAIL!" << std::endl;
  }
  else
  {
    std::cout << "ROSMASTER FOUND: qtros node init OK" << std::endl;
  }
}

void MainWindow::on_button_stopmaster_clicked()
{
  qnode.systemShutdown();
}

void MainWindow::on_button_recordbag_clicked()
{
  QProcess process;
  //need absolute path
  process.startDetached("xterm", QStringList()<<"/home/punnu/catkin_ws/src/qtros/resources/scripts/data_record_launch.sh");
}

void MainWindow::on_button_stopbag_clicked()
{
  //link via qnode
  qnode.stopbag();
}


/*****************************************************************************
** Implementation [Menu]
*****************************************************************************/
void MainWindow::closeEvent(QCloseEvent *event)
{
	QMainWindow::closeEvent(event);
}

}  // namespace qtros

