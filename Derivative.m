% ======================================================================= %
% SCRIPT NAME : Derivative
% DESCRIPTION : Calculate the derivative of a function using the numerical
%               approach by Derivation of Centered Difference
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function Derivative
%% INPUT SECTION
syms x

F = 5*x.^2;  % Input F function to be derivated
xk = 2;      % Pontual xk value to be substituted in F function
h = 10^-1;   % Pertubation (Range) in the Derivative


%% SCRIPT SECTION
% Uncomment next line if you want to export fun to Command Window
% global fun

fun = zeros(4,1);

% Calculate the first derivative to fourth derivative using 
% centered difference approach, and substitutes the input value in function
fun(1,1) = (-subs(F,xk+2*h) +  8*subs(F,xk+h)  -  8*subs(F,xk-h) + subs(F,xk-2*h))/(12*h);
fun(2,1) = (-subs(F,xk+2*h) + 16*subs(F,xk+h)  - 30*subs(F,xk)   + 16*subs(F,xk-h) - subs(F,xk-2*h))/(12*h^2);
fun(3,1) = (-subs(F,xk+3*h) + 8*subs(F,xk+2*h) - 13*subs(F,xk+h) + 13*subs(F,xk-h) - 8*subs(F,xk-2*h) + subs(F,xk-3*h))/(8*h^3);
fun(4,1) = (+subs(F,xk+2*h) - 4*subs(F,xk+h)   +  6*subs(F,xk)   -  4*subs(F,xk-h) + subs(F,xk-2*h))/(h^4);


%% OUTPUT SECTION 
% Print the output in Command window
sprintf('Numerical Derivative\nx = %.f  h = %.1e  F = %s \n f (x) = %.10f \n f1(x) = %.10f \n f2(x) = %.10f\n f3(x) = %.10f \n f4(x) = %.10f ',xk,h,F, subs(F,xk), fun(1,1), fun(2,1), fun(3,1), fun(4,1))

% clearvars x F xk h

end

