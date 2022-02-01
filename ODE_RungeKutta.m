% ======================================================================= %
% SCRIPT NAME : ODE_RungeKutta
% DESCRIPTION : Solution of Ordinary Differential Equation 
%               using Runge-Kutta 5th order
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function ODE_RungeKutta
%% INPUT SECTION
syms x y

F  = 4*exp(0.8*x) - 0.5*y;  % Input F function to be solved
y0 = 2; x0 = 0;             % Initial condittion
h  = 0.5;                   % Step in function
xf = 4;                     % final value to be used


%% SCRIPT SECTION
% Uncomment next line if you want to export fun to Command Window
% global fun

fun = y0;
xx = x0;
% Obtain Ks coefficents and insert in function 
for k = x0 : h : (xf-h)
   k1 = subs(F,{x,y},{xx, fun});
   k2 = subs(F,{x,y},{xx + h/4, fun + k1*h/4});
   k3 = subs(F,{x,y},{xx + h/4, fun + k1*h/8 + k2*h/8});
   k4 = subs(F,{x,y},{xx + h/2, fun - k2*h/2 + k3*h});
   k5 = subs(F,{x,y},{xx + 3*h/4, fun + 3*k1*h/16 + 9*k4*h/16});
   k6 = subs(F,{x,y},{xx + h, fun - 3*k1*h/7 + 2*k2*h/7 + 12*k3*h/7 - 12*k4*h/7 + 8*k5*h/7});
 
fun = fun + (h/90)*(7*k1 + 32*k3 + 12*k4 + 32*k5 + 7*k6);
xx = xx+h;
end


%% OUTPUT SECTION
% Print the output in Command window
sprintf('Result of ODE by RungeKutta=  %.12f', fun)

%clearvars x y F y0 h xf xx

end

