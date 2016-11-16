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
MR = MR * 1e-3; %Ohms 
MT = MT * 1e-3; %Nm/A 
ME = ME*2*pi/60; %rad/s/V
GM1 = GM1 * 1e-3; %kg 
GJ1 = GJ1 * 1e-3; %kgm^2
GB1 = GB1 * 1e-3; %kgm^2/s
GM2 = GM2 * 1e-3; 
GJ2 = GJ2 * 1e-3; 
GB2 = GB2 * 1e-3; 
PK0 = PK0 * 6894.76; %PSI to Pa 
PT0 = PT0 * 1e-3; 
PM0 = PM0 * 6894.76; 
ID0 = ID0 * 0.01; %m^2
QU1 = QU1 * RadPerDeg; 
QU2 = QU2 * RadPerDeg; 
QL1 = QL1 * RadPerDeg; 
QL2 = QL2 * RadPerDeg; 

% ========
%    Q0
% ========
% Pump
% ----
Pump0n = PK0; 
Pump0d = [1 1/PT0]; 
Pump0sat = PM0; %Max/min output of pump 
% Cylinder
% --------
JntMin0 = QL0; 
JntMax0 = QU0; 
M0 = 1; 
B0 = 8.45e-3; 
Mech0n = [pi*(ID0/2)^2]; %F = Pressure x Area  
Mech0d = [M0 B0]; 

% Feedback
% --------
%FB0 = 1; 

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
Elec1d = [ML MR]; %1/(R+sL)
TConst1 = MT; %Nm/A  
Mech1d = [MJ+GJ1 MB+GB1]; % 1/(Js + B)
BackEMF1 = 1/ME; 

% Gear
% ----
JntMax1 = QU1; 
JntMin1 = QL1; 
Gear1 = 1/GR1; 
% Gravity
% -------
Grav = 1/GR1*G*(M1*L1/2 + (MM + GM1 + GM2)*L1);  

% Feedback
% --------
FB1 = 1;

% ========
%    Q2
% ========
% Amp
% ---
Amp2n = [C1+C2 1/R1+1/R2]; 
Amp2d = [C2 1/R2]; 
AmpSat2 = VSS;  
% Motor
% -----
Elec2d = [ML MR]; %1/R
TConst2 = MT; %Nm/A  
Mech2d = [MJ+GJ2 MB+GB2]; % 1/(Js + B)
BackEMF2 = 1/ME; % 1 rad/s = 9.55 RPM, 1/(RPM/V) = V/RPM
% Gear
% ----
JntMax2 = QU2; 
JntMin2 = QL2; 
Gear2 = 1/GR2; 
% Feedback
% --------
FB2 = 1;

% ==================
% TRANSFER FUNCTIONS
% ==================
% Compute transfer functions from above values and perform system analysis
% You may prefer to put this section in a separate .m file
