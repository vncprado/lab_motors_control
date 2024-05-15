/*
* pid_controller.cpp
*
* Created: 29/09/2016 13:48:12
* Author: Olly McBride
*
* This work is licensed under the Creative Commons Attribution 4.0 International License.
* To view a copy of this license, visit http://creativecommons.org/licenses/by/4.0/.
*
*/

#include "pid_controller.h"

PID_CONTROLLER::PID_CONTROLLER()
{
	_dInput = 0;
	_prev = 0;
	_integral = 0;		// clear PID history

	_rampLim = 0;		// disable rate limit
	_prevOutput = 0;

	_intROS=0;
	_intROSConstrain=0;

	setLimits(DEFAULT_LIMIT_MIN, DEFAULT_LIMIT_MAX);
	setGains(DEFAULT_GAIN_P, DEFAULT_GAIN_I, DEFAULT_GAIN_D);
	enable(true);

}

// enable the PID controller (default)
void PID_CONTROLLER::enable(void)
{
	enable(true);
}

// disable the PID controller
void PID_CONTROLLER::disable(void)
{
	enable(false);
}

// set the PID controller to be enabled/disabled
void PID_CONTROLLER::enable(bool en)
{
	_en = en;
}

void PID_CONTROLLER::reset(void)
{
	_dInput = 0;
	_prev = 0;
	_integral = 0;
}

double PID_CONTROLLER::getInt(){
	return _intROS;
}

double PID_CONTROLLER::getIntConstrain(){
	return _intROSConstrain	;
}

double PID_CONTROLLER::run(double targ, double curr)
{
	if (!_en)
	{
		return 0;
	}

	double output = 0;
	double error = targ - curr;
	double sampleTime = (_sampleTimer.stop() / 1000);		// sampleTime in ms
	// double deltaTime = millis() - _prevTime;
	// _prevTime = millis();	
	
	if (sampleTime>0)
	{
		// integral summation allows _Ki to change without causing unwanted disturbances 
		if(error>targ*0.33 || error < -targ * 0.33){
			_integral=0;
		}else{
			_integral +=  error * (sampleTime/1000);
			_integral = constrain(_integral, _min, _max);
		}
		_intROS=_integral;
		// store the change in input to remove the derivative spike
		double _dInput = ((error - _prev) / (sampleTime/1000));
		_intROSConstrain=_dInput;
		// _dInput = ((error - _prev) / (sampleTime)/1000);

		// calculate and constrain output
		output = (_Kp * error) + (_Ki * _integral) + (_Kd * _dInput);
		output = constrain(output, _min, _max);

		// if a rate limit is set
		if (_rampLim != 0){
			double change = (output - _prevOutput);

			// if the change in outputs exceeds the rate limit
			if (change > _rampLim)
			{
				output = _prevOutput + _rampLim;		// just change by the ramp rate
			}
			else if (change < -_rampLim)
			{
				output = _prevOutput - _rampLim;		// just change by the ramp rate
			}
		}

		// store history
		_prev = error;			// previous pos/vel
		_prevOutput = output;	// store the previous output
	}

	// restart the sample timer
	_sampleTimer.start();

	return output;
}

// set the output value limits
void PID_CONTROLLER::setLimits(double min, double max)
{
	_min = min;
	_max = max;
}

// get the output value limits
void PID_CONTROLLER::getLimits(double *min, double *max)
{
	*min = _min;
	*max = _max;
}

// set the maximum change in output limit
void PID_CONTROLLER::setRampRate(double ramp)
{
	_rampLim = ramp;
}

// set the controller gains
void PID_CONTROLLER::setGains(float Kp, float Ki, float Kd)
{
	_Kp = Kp;
	_Ki = Ki;
	_Kd = Kd;
}

// get the gains of the controller
void PID_CONTROLLER::getGains(float *Kp, float *Ki, float *Kd)
{
	*Kp = _Kp;
	*Ki = _Ki;
	*Kd = _Kd;
}