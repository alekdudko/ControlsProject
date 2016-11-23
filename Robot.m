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

M1 = M1 * 1e-3;% Convert g -> Kg
R1 = R1 * 1e3; % kOhms - > Ohms
R2 = R2 * 1e3; % kOhms - > Ohms
C1 = C1 * 1e-6; % uF -> F
C2 = C2 * 1e-6; % uF -> F
MJ = MJ * 1e-7; % gcm^2 -> kgm^2 
MB = MB * 1e-7; % gcm^2/s -> kgm^2/s 
ML = ML * 1e-3; % mH -> H 
MR = MR * 1e-3; % mOhms -> Ohms 
MT = MT * 1e-3; %mNm/A -> Nm/A 
ME = ME*2*pi/60; %RPM/V -> rad/s/V
GM1 = GM1 * 1e-3; % g -> kg 
GJ1 = GJ1 * 1e-3; % gm^2 -> kgm^2
GB1 = GB1 * 1e-3; % gm^2/s -> kgm^2/s
GM2 = GM2 * 1e-3; % g -> kg
GJ2 = GJ2 * 1e-3; % g -> kg
GB2 = GB2 * 1e-3; % gm^2/s -> kgm^2/s
PK0 = PK0 * 6894.76; % PSI -> Pa 
PT0 = PT0 * 1e-3; % ms -> s 
PM0 = PM0 * 6894.76; % PSI -> Pa
ID0 = ID0 * 0.01; %m
QU1 = QU1 * RadPerDeg; %Deg -> Rad
QU2 = QU2 * RadPerDeg; 
QL1 = QL1 * RadPerDeg; 
QL2 = QL2 * RadPerDeg; 

%Note: Transfer functions only briefly covered here, described in detail in
%report

% ========
%    Q0
% ========

% Pump
% ----

%TF = PK0/(PT0s + 1)
Pump0n = PK0; 
Pump0d = [PT0 1]; 
Pump0sat = PM0; %Max/min output of pump 

% Cylinder
% --------

%TF = Area*(1/(Ms + B)
JntMin0 = QL0; 
JntMax0 = QU0; 
M0 = 1.3;  %Bv = ma can solve for m and a using graph
B0 = 1; 
Mech0n = pi*(ID0/2)^2; %F = Pressure x Area  
Mech0d = [M0 B0]; 

% Feedback
% --------
FB0 = 1; 

% ========
%    Q1
% ========
% Amp
% ---

%TF = (sR1R2(C1+C2) + R2 + R1)/(sR1R2C2 + R1)
Amp1n = [R1*R2*(C1+C2) R1+R2]; 
Amp1d = [R1*R2*C2 R1]; 
AmpSat1 = VSS; % Max/min output of amp

% Motor
% -----

%TF = (1/(MLs + MR))
Elec1d = [ML MR]; %1/(R+sL)

%Convert current to torque (elec to mech system)
TConst1 = MT; %Nm/A  

%TF = 1/(Js + B) Where J and B = inertia and friction seen by motor 1
Mech1d = [MJ+GJ1+((M1*(L1/2)^2)+MM*L1^2+GM2*L1^2)/(GR1^2) MB+GB1]; % 1/(Js + B)

%Convert from mech to elec system, BackEMF given in RPM/V
BackEMF1 = 1/ME; 

% Gear
% ----

%Max/Min angles of Joint Q1
JntMax1 = QU1; 
JntMin1 = QL1; 

%50 turns of first gear = 1 turn of second gear, frequency and torque must
%be scaled appropriately 
Gear1 = 1/GR1; 

% Gravity
% -------

%Torque due to arm + torque due to motor 2 and gearbox 2 
Grav = G*M1*L1/2 + G*(MM + GM2)*L1;  

% Feedback
% --------
FB1 = 1;

% ========
%    Q2
% ========
% Amp
% ---

%TF = (sR1R2(C1+C2) + R2 + R1)/(sR1R2C2 + R1)
Amp2n = [R1*R2*(C1+C2) R1+R2]; 
Amp2d = [R1*R2*C2 R1]; 
AmpSat2 = VSS;  

% Motor
% -----

%TF = (1/(MLs + MR))
Elec2d = [ML MR]; 

%Convert current to torque (elec to mech system)
TConst2 = MT; 

% 1/(Js + B) Where J and B = inertia and friction seen by motor 2
Mech2d = [MJ+GJ2 MB+GB2]; 

%Convert from mech to elec system, BackEMF given in RPM/V
BackEMF2 = 1/ME; 

% Gear
% ----

%Max/Min angles for joint Q2
JntMax2 = QU2; 
JntMin2 = QL2; 

%5 turns of first gear = 1 turn of second gear, frequency and torque must
%be scaled appropriately 
Gear2 = 1/GR2;  

% Feedback
% --------
FB2 = 1;




