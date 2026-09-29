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
## output
<img width="940" height="569" alt="Audio_output" src="https://github.com/user-attachments/assets/b110464a-08a5-4b6d-b782-62212113dba2" />
- LMS enhanced audio
- NLMS enhanced audio
<img width="946" height="593" alt="LMS-NLMS_output" src="https://github.com/user-attachments/assets/7f97cdce-e007-4551-bbad-c2fe5480b590" />
- SNR Calculation
--- ANC RESULTS ---
Noisy Audio SNR : 5.90 dB
LMS Output SNR  : 20.45 dB
NLMS Output SNR : 4.94 dB
Playing noisy audio...
Playing LMS output...
Playing NLMS output...



## Future Scope

The algorithm can be extended toward a real-time two-channel
Active Noise Cancellation system using:

- Primary microphone
- Reference microphone
- Real-time adaptive filtering
- Embedded hardware
- Jetson Nano / other edge computing platforms
