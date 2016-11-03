% This script sets all model  & controller parameters for the 
% Paint Booth Factory

% Example: Specifying a Dynamics Block
% n = [1 2 3];
% d = [4 5 6];
% Transfer Function = (s^2 + 2s + 3) / (4s^2 + 5s + 6)

% ===============
% NORMALIZE UNITS
% ===============
% Example:
% Mass      (Kg)
M1 = M1 * 1e-3;              % Convert g -> Kg
R1 = R1 * 1e3; %Ohms
R2 = R2 * 1e3; 
C1 = C1 * 1e-6; %F
C2 = C2 * 1e-6; 
MJ = MJ * 1e-7; %kgm^2 
MB = MB * 1e-7; %kgm^2/s 
ML = ML * 1e-3; %H 
MR = MR * 1e3; %Ohms 
MT = MT * 1e5; %Nm/A 
GM1 = GM1 * 1e-3; %kg 
GJ1 = GJ1 * 1e-3; %kgm^2
GB1 = GB1 * 1e-3; %kgm^2/s
GM2 = GM2 * 1e-3; 
GJ2 = GJ2 * 1e-3; 
GB2 = GB2 * 1e-3; 
PK0 = PK0 * 6894.76; %PSI to Pa 
PT0 = PT0 * 1e-3; 
PM0 = PM0 * 6894.76; 

% ========
%    Q0
% ========
% Pump
% ----
Pump0n = PK0; 
Pump0d = [PT0 1]; 
Pump0sat = PM0; %Max/min output of pump 
% Cylinder
% --------
JntMin0 = -0.5; 
JntMax0 = 4.5; 

% Feedback
% --------


% ========
%    Q1
% ========
% Amp
% ---
Amp1n = [C1+C2 1/R1+1/R2]; 
Amp1d = [C2 1/R2]; 
AmpSat1 = VSS; 
% Motor
% -----
Elec1n = 1/MR; %1/R
TConst1 = 5; %Nm/A  
Mech1d = [0.016 65e-6]; % 1/(Js + B)
BackEMF1 = (9.55/25); % 1 rad/s = 9.55 RPM, 1/(RPM/V) = V/RPM
% Gear
% ----
JntMax1 = pi/2; 
JntMin1 = -pi; 
Gear1 = 50; 
% Gravity
% -------
Grav = G; 

% Feedback
% --------


% ========
%    Q2
% ========
% Amp
% ---
Amp2n = [C1+C2 1/R1+1/R2]; 
Amp2d = [C2 1/R2]; 
AmpSat2 = 480;  
% Motor
% -----
Elec2n = 1/MR; %1/R
TConst2 = 5; %Nm/A  
Mech2d = [0.016 65e-6]; % 1/(Js + B)
BackEMF2 = (9.55/25); % 1 rad/s = 9.55 RPM, 1/(RPM/V) = V/RPM
% Gear
% ----
JntMax2 = 4*pi/5; 
JntMin2 = -4*pi/5; 
Gear2 = 5; 
% Feedback
% --------
FB2 = 1; %Not sure how to calculate 

% ==================
% TRANSFER FUNCTIONS
% ==================
% Compute transfer functions from above values and perform system analysis
% You may prefer to put this section in a separate .m file
