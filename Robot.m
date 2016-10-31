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


% ========
%    Q0
% ========
% Pump
% ----

% Cylinder
% --------

% Feedback
% --------


% ========
%    Q1
% ========
% Amp
% ---

% Motor
% -----

% Gear
% ----

% Gravity
% -------

% Feedback
% --------


% ========
%    Q2
% ========
% Amp
% ---

% Motor
% -----

% Gear
% ----

% Feedback
% --------


% ==================
% TRANSFER FUNCTIONS
% ==================
% Compute transfer functions from above values and perform system analysis
% You may prefer to put this section in a separate .m file
