% ======================================================================= %
% SCRIPT NAME : Interpolation_Vandermonde
% DESCRIPTION : Interpolation the Vandermonde Matrix approach
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %
% DISCLAIMER: This function may result in a ill-conditioned matrix;
% For better results, use Interpolation_Newton


function Interpolation_Vandermonde
%% INPUT SECTION
syms x

% Input data is a sized nx2 Matrix Dados[n,2] where:
% Dados[n,1]=x   and   Dados[n,2]=f(x)
Dados = [1 1
         3 4
         5 9
         6 16
         8 25];


%% SCRIPT SECTION
% Uncomment next line if you want to export coef and fun to Command Window
% global coeficientes fun

A = fliplr(vander( Dados(:,1) ));
B = Dados(:,2);

% Obtain the coefficients by resolution of the matrix
coeficientes = A\B;

% Writting the polynomial fun = a0 + a1x + a2x2 + ...
fun = 0;
for n = 1 : 1 : size(Dados,1)
   fun = fun + double(coeficientes(n, 1)) * x^(n-1);
end


%% OUTPUT SECTION
% Export graphic to Command window
minValue = floor(min(Dados(1,2) - Dados(2,2), min(Dados(:,1)*0.65)));
maxValue = ceil(min( Dados(length(Dados), 2) + abs(min(Dados(1,2) - Dados(2,2))), max(Dados(:,1)*1.05)));
ezplot(fun, minValue, maxValue);  hold on; grid on
scatter(Dados(:,1),Dados(:,2))
hold off

% Print the output in Command window
vpa(Dados)
vpa(fun,6)

% clearvars x Dados A B minValue maxValue

end

