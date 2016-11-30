% This script sets the controller parameters for the Paint Booth Factory

% ================
% CONTROLLER GAINS
% ================
% Find the values that are stable and allow you to maximize throughtput
% as much as possible without violating the Position Error constraint.

PID0 = [0.001 0.002 0.001];
PID1 = [230 75 -0.469];
PID2 = [40 60 -0.5];


% ==========
% THROUGHPUT
% ==========
% Reduce these values as much as possible to increase throughput 
% as much as possible without violating the Position Error constraint.

PaintTime = 3;    % Time spent painting truck
ResetTime = 1;    % Time spent resetting robot position for next truck


% ===========
% JOINT LIMIT
% ===========
% Modify this value to adjust where the truck is when you begin painting
% it to avoid running into the limit of the Q0 prismatic joint.

StartX    = 0;    % Initial position of truck when painting starts
