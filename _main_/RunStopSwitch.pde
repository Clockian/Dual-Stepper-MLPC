/* RunStopSwitch.pde
Contributers:
    Jasque Saydyk
	
Purpose: Controls run stop switch on hardware
*/
#include <IOShieldOled.h>
#include <RunStopSwitch.h>

RunStopSwitch::RunStopSwitch(int S1)
    :SW1(S1)
    {
    }

void RunStopSwitch::init_switch(){
    pinMode(SW1, INPUT);
}

int RunStopSwitch::on_off(){
    return digitalRead(SW1);
}
