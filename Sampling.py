#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Feb 28 05:06:10 2018

@author: ameera
"""

import numpy as np 
import matplotlib.pyplot as plt

time_of_view        = 1.; # s.
analog_time         = np.linspace (0, time_of_view, 10e5); # s.
#select required sampling rate (user data enrty) 
a=float(input("enter the Sampling Rate (HZ):")) 
#select Required PHASE SHIFT (user data entry)
b=phase=float(input("enter the phase  shift (in Dedgree) :")) 

sampling_rate       =a; # Hz
sampling_period     = 1. / sampling_rate; # s
sample_number       = time_of_view / sampling_period;
sampling_time       = np.linspace (0, time_of_view, sample_number);

carrier_frequency   = 9.;
amplitude           =1;
phase               = b;

quantizing_bits     = 4;
quantizing_levels   = 2 ** quantizing_bits / 2;
quantizing_step     = 1. / quantizing_levels;


def analog_signal1 (time_point):
    return amplitude * np.sin (carrier_frequency  * np.pi  * time_point + phase);
sampling_signal     = analog_signal1 (sampling_time);
quantizing_signal   = np.round (sampling_signal / quantizing_step) * quantizing_step;


fig = plt.figure ()
plt.plot (analog_time,   analog_signal1 (analog_time) );
#plt.stem (sampling_time, sampling_signal);
plt.stem (sampling_time, quantizing_signal, linefmt='r-', markerfmt='rs', basefmt='r-');
plt.title("Analog to digital signal conversion")
plt.xlabel("Time")
plt.ylabel("Amplitude")

plt.show()

def analog_signal2 (time_point):
    return amplitude * np.cos (2 * np.pi * carrier_frequency * time_point + phase);
sampling_signal     = analog_signal2 (sampling_time);
quantizing_signal   = np.round (sampling_signal / quantizing_step) * quantizing_step;
fig = plt.figure ()
plt.plot (analog_time,   analog_signal1 (analog_time) );
plt.stem (sampling_time, quantizing_signal, linefmt='r-', markerfmt='rs', basefmt='r-');
plt.title("Analog to digital signal conversion")
plt.xlabel("Time")
plt.ylabel("Amplitude")

plt.show()
def analog_signal3 (time_point):
    return amplitude * np.exp (carrier_frequency * time_point);
sampling_signal     = analog_signal3 (sampling_time);
quantizing_signal   = np.round (sampling_signal / quantizing_step) * quantizing_step;

fig = plt.figure ()
plt.plot (analog_time,   analog_signal2 (analog_time) );
#plt.stem (sampling_time, sampling_signal);
plt.stem (sampling_time, quantizing_signal, linefmt='r-', markerfmt='rs', basefmt='r-');
plt.title("Analog to digital signal conversion")
plt.xlabel("Time")
plt.ylabel("Amplitude")

plt.show()