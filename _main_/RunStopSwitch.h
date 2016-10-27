/* RunStopSwitch.h
Contributers:
    Jasque Saydyk
	
Purpose: Run Switch to stop and run hardware
*/
#ifndef RUNSTOPSWITCH_H
#define RUNSTOPSWITCH_H

#include <IOShieldOled.h>

class RunStopSwitch{
	private:
		int SW1;
	public:
		RunStopSwitch(int S1);
		void init_switch();
		int on_off();
};
#endif
