/* _main_.pde
Contributers:
    Jasque Saydyk
    
Purpose: Run the Dual Stepper Motors Laser Pointer Control Program
*/
#include <StepperMotor.h>
#include <Switch.h>
#include <Mode.h>

StepperMotor motor1(70, 71, 72, 73);
StepperMotor motor2(74, 75, 76, 77);

Switch switch1(2);
Switch switch2(7);
Switch switch3(8);
Switch switch4(79);

Mode mode(motor1, motor2, switch3, switch4);

void setup(){
  switch1.init_var();
  switch2.init_var();
  mode.init_var();
}

void loop(){
  if(switch1.on_off() == 1){
      if(switch2.on_off() == 0){
          mode.manual();
      }
      else if(switch2.on_off() == 1){
          mode.automatic();
      }
  }
  else{
      mode.off();
  }
}
