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

x_values = [1.1 2.1 3.5 4.1  5.5  6.1   7.0  8.1  9.0  10.1 11.0];
y_values = [5.5 9.0 13  15.1 17.5 17.45 17.8 18.1 18.4 18.9 19.5];

% The Input format is a size [n,2] matrix 'Dados', where:
Dados(:,1) = x_values;  % [n,1] = x
Dados(:,2) = y_values;  % [n,2] = f(x) = y


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
minValue = floor(min(Dados(1,1) - Dados(2,1)*0.5, min(Dados(:,1)*0.65)));
maxValue = ceil(min( Dados(length(Dados), 1) + abs(min(Dados(1,1) - Dados(2,1))), max(Dados(:,1)*1.05)));  
ezplot(fun, [minValue maxValue]);  hold on; grid on
scatter(Dados(:,1), Dados(:,2));
hold off

% Print the output in the Command window
vpa(fun, 10)

end
