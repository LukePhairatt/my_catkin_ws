#ifndef _DEMO_THREAD_
#define _DEMO_THREAD_

#include <thread>
#include <iostream>
#include <unistd.h>
#include <boost/thread.hpp>

class dummy_thread
{
	public:
		dummy_thread();
		~dummy_thread();
		
		void run();
		void task();
		void stop();
		bool joinable();

	public:
	    bool g_run;
	    bool g_exit;
	    std::thread m_thread;
		
};

#endif
