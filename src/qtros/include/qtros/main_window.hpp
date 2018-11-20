/**
 * @file /include/qtros/main_window.hpp
 *
 * @brief Qt based gui for qtros.
 *
 * @date November 2010
 **/
#ifndef qtros_MAIN_WINDOW_H
#define qtros_MAIN_WINDOW_H

/*****************************************************************************
** Includes
*****************************************************************************/

#include <QtGui/QMainWindow>
#include "ui_main_window.h"
#include "qnode.hpp"
#include <QProcess>
#include <QMessageBox>

/*****************************************************************************
** Namespace
*****************************************************************************/

namespace qtros {

/*****************************************************************************
** Interface [MainWindow]
*****************************************************************************/
/**
 * @brief Qt central, all operations relating to the view part here.
 */
class MainWindow : public QMainWindow {
Q_OBJECT

public:
	MainWindow(int argc, char** argv, QWidget *parent = 0);
	~MainWindow();

	void closeEvent(QCloseEvent *event); // Overloaded function
  void startButtonMaster();
  void showNoMasterMessage();


public Q_SLOTS:
	/******************************************
	** Auto-connections (connectSlotsByName())
	*******************************************/
  //void on_actionAbout_triggered();
  //void on_button_connect_clicked(bool check);
  void on_button_startmaster_clicked();
  void on_button_stopmaster_clicked();
  void on_button_recordbag_clicked();
  void on_button_stopbag_clicked();

  /******************************************
  ** Manual connections
  *******************************************/
  //void updateLoggingView(); // no idea why this can't connect automatically


private:
	Ui::MainWindowDesign ui;
	QNode qnode;
};

}  // namespace qtros

#endif // qtros_MAIN_WINDOW_H
