% ======================================================================= %
% SCRIPT NAME : Roots_Newton
% DESCRIPTION : Find roots of function Numerically using Newton approach
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function Roots_Newton
%% INPUT SECTION
syms x

F = x^2 - 4;  % Input F function
xk = 1;           % Initial estimative
errorAdmissible = 10^-12;  % Estimated absolute error


%% SCRIPT SECTION
% Uncomment next line if you want to export xk to Command Window
% global xk

errorAbsolute = 100;

while (errorAbsolute > errorAdmissible)
   xk_OLD = xk;
   xk = double(xk_OLD - subs(F, xk)/subs(diff(F,x), xk));
   % xk = double(xk_OLD - subs(F,xk)/((subs(F,xk + 10^-6) - subs(F,xk))/10^-6)); % [ DIFERENCAS FINITA ]
   errorAbsolute = abs(xk - xk_OLD);
end
errorRelative = abs((xk - xk_OLD)/(xk)*100);


%% EXPORTANDO A FUNCAO
% Export graphic to Command window
ezplot(F, round(xk-10), round(xk+10)); hold on; grid on;
scatter(xk,subs(F,xk));
hold off

% Print the output in Command window
sprintf(' Zero de funcao - M�todo de Newton-Raphson \n F = %s\n Valor de x = %.12f  ; f(x) = %.19f   \n Erro absoluto = %.9f  ; Erro Relativo = %.10f %%',F, xk, subs(F,xk), errorAbsolute, errorRelative)

% clearvars x F xk errorAdmissible errorAboslute errorRelative

end

