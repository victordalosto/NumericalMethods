% ======================================================================= %
% SCRIPT NAME : Integral
% DESCRIPTION : Quadrature rule by Newton-Cotes Numerical Integration
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function Integral
%% INPUT SECTION
syms x 

F = exp(x)*x -5;  % Input F function to integrated
upperLimit = 2;
lowerLimit = 5;

n = 800; % Number of Points to be used in the Process
% Observation: n must be multiply of 4. Exs: 4 80 120 260 400 800 2000


%% SCRIPT SECTION
% Uncomment next line if you want to export fun to Command Window
% global fun

% Create an array spaced for X values
XX = linspace(upperLimit, lowerLimit, 3/4*n + 1);

% The size of each step
h = XX(1,4) - XX(1,1);

% Calculates the Sum of the small areas (F*h)
fun = 0;
for k = 1:3:(3/4*n)
   fun = fun + (h/8) * (subs(F,XX(1,k)) + 3*subs(F,XX(1,k+1)) + 3*subs(F,XX(1,k+2)) + subs(F,XX(1,k+3)));
end


%% OUTPUT SECTION
% Print the output in the Command window
sprintf('Numerical Integration - Method of  Newton Cortes (3/8 Simpson)\nF = %s      Bounds = [ %.f ; %.f ]\nN. points = %.f      delta(H) = %.3e \n\nArea = %s ', F, lowerLimit, upperLimit ,n, h, vpa(fun))

end
