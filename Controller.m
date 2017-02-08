% This script sets the controller parameters for the Paint Booth Factory

% ================
% CONTROLLER GAINS
% ================
% Find the values that are stable and allow you to maximize throughtput
% as much as possible without violating the Position Error constraint.

PID0 = [0.000621 0.00182 0.000998];
PID1 = [236 -13.6 -0.9];
PID2 = [43.7 0.534 -0.35];

% ==========
% THROUGHPUT
% ==========
% Reduce these values as much as possible to increase throughput 
% as much as possible without violating the Position Error constraint.

PaintTime = 3.5;    % Time spent painting truck
ResetTime = 1;    % Time spent resetting robot position for next truck


% ===========
% JOINT LIMIT
% ===========
% Modify this value to adjust where the truck is when you begin painting
% it to avoid running into the limit of the Q0 prismatic joint.

StartX    = 0;    % Initial position of truck when painting starts
