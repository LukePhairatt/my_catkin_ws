#include "dummy_thread.hpp"


dummy_thread::dummy_thread()
{
	g_run = true;
	g_exit = false;
}

dummy_thread::~dummy_thread()
{
}
		
void dummy_thread::run()
{
	g_run = true;
	//std::thread t1(&dummy_thread::task,this);
	//t1.detach();
	m_thread = std::thread(&dummy_thread::task, this);
}

void dummy_thread::stop()
{
	// ignore if thread is not running already
	if(g_run == false) return;
	
	std::cout << "called thread exit ... " << std::endl;
	g_run = false;
	// wait until cleanup done
	while(!g_exit)
	{
		sleep(1);
	}
	std::cout << "exit thread done... " << std::endl;
}

void dummy_thread::task()
{
	std::cout << "running thread... " << std::endl;
	while(g_run)
	{
		std::cout << "   running dummy thread ... " << std::endl;
		sleep(1);
	}
	std::cout << "cleaning thread... " << std::endl;
	g_exit = true;
}

bool dummy_thread::joinable()
{
	return m_thread.joinable();
}
