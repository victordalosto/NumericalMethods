% ======================================================================= %
% SCRIPT NAME : Roots_Bisection
% DESCRIPTION : Finds the roots of a function Numerically using Bissection
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function Roots_Bisection
%% INPUT SECTION
syms x

F = x^2.1 - 4;   % Input F function
lowerLimit = 0;  % An possible interval where the root is
upperLimit = 16;
errorAdmissible = 10^-14; % Estimated absolute error


%% SCRIPT SECTION
% Uncomment next line if you want to export xk to Command Window
% global xk

errorAbsolute = 100;
while (errorAbsolute > errorAdmissible)
   xk_OLD = lowerLimit;
   xk = (lowerLimit+upperLimit)/2;
   fun = subs(F,lowerLimit) * subs(F,xk);

   if  (fun < 0)
      upperLimit = xk;
   else
      lowerLimit = xk;
   end
   errorAbsolute = abs(xk - xk_OLD);
end
errorRelative = abs((lowerLimit-upperLimit)/(lowerLimit+upperLimit)*100);


%% EXPORTANDO A FUNCAO
% Export graphic to Command window
ezplot(F, round(xk-10), round(xk+10)); hold on; grid on;
scatter(xk,subs(F,xk));
hold off

% Print the output in the Command window
sprintf(' Roots of function \nF = %s\nValue of x = %.12f   ; f(x) = %.12f   \nErrorAbsolute = %.10f  ; Error Relative = %.12f %%',F, xk, subs(F,xk), errorAbsolute, errorRelative)

end
