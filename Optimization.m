% ======================================================================= %
% SCRIPT NAME : Optimization
% DESCRIPTION : Iterative method for finding the roots of a differentiable
%               function, that is solution for F(x) = 0
%             : Script to minimize or maximize a function
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function Optimization
%% INPUT SECTION
syms x
F = (721*x^2)/16 - (3943*x)/60 + 677/20;  % Input F function to op
xk = 9;                   % Initial try value
errorAdmissible = 10^-6;  % Estimated absolute error

% Uncomment lines 20 and 32-33 if you want to use Difference finite approach
% h  = 10^-6;


%% SCRIPT SECTION
% Uncomment next line if you want to export xk to Command Window
% global xk

errorAbsolute = 100;

while (errorAbsolute > errorAdmissible)
   xk_OLD = xk;
   xk = double(xk_OLD  -  subs(diff(F, x), xk) / subs(diff(F, x, 2), xk));
   % Uncomment next line if you want to use Difference finite approach
   % xk = double(xk_OLD - ((subs(F, xk+h) - subs(F, xk))/h)/((subs(F, xk+h) + subs(F, xk-h) - 2*subs(F, xk))/h^2)); % [Diferen�as FINITAS]
   errorAbsolute = abs(xk - xk_OLD);
end
errorRelative = abs((xk - xk_OLD)/(xk)*100);


%% OUTPUT SECTION
% Export graphic to Command window
minValue = round(xk-4);
maxValue = round(xk+1);
ezplot(fun, [minValue maxValue]);  hold on; grid on
scatter(xk, subs(F, xk));
hold off;

% Print the output in the Command window
sprintf('Newton Method for Optimization \nValue of x = %.12f  ; f(x) = %.12f  \nf1(x) = %.12f \nAbsolute error = %.9f  ; Relative Error = %.10f %%', xk, subs(F,xk), subs(diff(F,x,1),xk), errorAbsolute, errorRelative)

end
