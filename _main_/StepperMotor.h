/* StepperMotor.h
Contributers:
    Jasque Saydyk
	
Purpose: Control a single Stepper Motor
*/
#ifndef STEPPERMOTOR_H
#define STEPPERMOTOR_H

class StepperMotor{
	private:
		int LD1;
		int LD2;
		int LD3;
		int LD4;
		int indexM;
                int motorTime;
                int motorStep;
	public:
		StepperMotor(int L1, int L2, int L3, int L4);
                void set_motorTime(int motor_time);
                int get_motorStep();
		void init_var();
                void off();
		void run_motor(bool direction); //False goes negative, true positive		
};
#endif
