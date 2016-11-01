/* _main_.pde
Contributers:
    Jasque Saydyk
    
Purpose: Run the Dual Stepper Motors Laser Pointer Control Program
*/
#include <StepperMotor.h>
#include <Switch.h>
#include <Mode.h>

StepperMotor motorX(70, 71, 72, 73);
StepperMotor motorY(74, 75, 76, 77);

Switch switch1_System(2);
Switch switch2_Mode(7);
Switch switch3(8);
Switch switch4(79);

Mode mode(motorX, motorY, switch3, switch4);

void setup(){
  switch1_System.init_var();
  switch2_Mode.init_var();
  mode.init_var();
}

void loop(){
  if(switch1_System.on_off() == 1){
      if(switch2_Mode.on_off() == 0){
          mode.manual();
      }
      else{
          mode.automatic();
      }
  }
  else{
      mode.off();
  }
}
