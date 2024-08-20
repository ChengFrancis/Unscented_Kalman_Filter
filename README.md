# Unscented_Kalman_Filter
ECE 9156 Project

This repository contains a MATLAB function of the Unscented Kalman Filter (UKF) for estimating the state of a nonlinear dynamic system. The UKF is used to track the position and orientation of a robot as it moves along a circle plane.

## Overview

The code simulates the movement of a robot in polar coordinates (radius `r` and angle `theta`) and uses the UKF to estimate its position based on noisy measurements. The main components include:

- **State Transition Function (`state_transition`)**: Defines how the robot's state evolves over time and process noise.
- **Measurement Function (`measurement_function`)**: Generates noisy measurements from the robot's current state.
- **Unscented Kalman Filter (`UKF`)**: The core algorithm for state estimation.

## Files

- **`main.m`**: The main script that initializes parameters, runs the UKF, and plots the results.
- **`UKF.m`**: The function that implements the Unscented Kalman Filter.
- **`UnsentTransform.m`**: The function that performs the unscented transformation.
- **`SigmaPoints.m`**: The function that generates sigma points around the current state estimate.
- **`state_transition.m`**: The function that defines the state transition (system dynamics).
- **`measurement_function.m`**: The function that simulates the measurement process.

## Usage

To run the simulation:

1. Download or clone this repository.
2. Open MATLAB and navigate to the directory containing the files.
3. Run `main.m` to execute the simulation and generate plots of the robot's estimated path.

## Key Parameters

- **State Variables (`n`)**: Number of state variables (in this case, `r` and `theta`).
- **Process Noise (`Q`)**: Covariance of the process noise.
- **Measurement Noise (`R`)**: Covariance of the measurement noise.
- **Initial State (`s`)**: Initial state of the robot.

## Notes

The script generates a plot showing the estimated path of the robot based on the UKF. The robot's actual path is calculated using the state transition function. Meanwhile, the UKF estimates are updated based on noisy measurements.

## License

This project is open-source and available under the MIT License.
