# ANC-Noise-Reduction-LMS-NLMS
Adaptive noise cancellation using LMS and NLMS algorithms in MATLAB.
This project implements Adaptive Noise Cancellation (ANC) using
LMS (Least Mean Squares) and NLMS (Normalized Least Mean Squares)
adaptive filtering algorithms in MATLAB.

The project takes a speech/audio signal, adds noise to it, and
uses adaptive filtering techniques to reduce the unwanted noise.

## Algorithms Used

- LMS Adaptive Filter
- NLMS Adaptive Filter

## System Flow

Original Speech
        ↓
Noise Generation
        ↓
Noisy Speech
        ↓
Reference Noise
        ↓
Adaptive Filter
   ┌────┴────┐
   ↓         ↓
  LMS       NLMS
   ↓         ↓
Enhanced Speech

## Software Used

- MATLAB
- Signal Processing concepts
- Adaptive Filtering

## Input

The MATLAB program allows the user to select a WAV or MP3 audio file.

## Output

The program produces:

- Original audio
- Noisy audio
- LMS enhanced audio
- NLMS enhanced audio
- SNR comparison

## Future Scope

The algorithm can be extended toward a real-time two-channel
Active Noise Cancellation system using:

- Primary microphone
- Reference microphone
- Real-time adaptive filtering
- Embedded hardware
- Jetson Nano / other edge computing platforms
