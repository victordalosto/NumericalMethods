% ======================================================================= %
% SCRIPT NAME : CurveFitting
% DESCRIPTION : Find a curve that best fit a series of data points
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function CurveFitting
%% INPUT SECTION
syms x
x_values = [1.1 2.1 3.5 4.1  5.5  6.1   7.0  8.1  9.0  10.1 11.0];
y_values = [5.5 9.0 13  15.1 17.5 17.45 17.8 18.1 18.4 18.9 19.5];

% The Input format is a size [n,2] matrix 'Dados', where:
Dados(:,1) = x_values;  % [n,1] = x
Dados(:,2) = y_values;  % [n,2] = f(x) = y


% Degree of the polynomial to be exported f(x) = sum (const*x^m)
m = 3;
% If you want a polynomial Curve fitting approach set 'approach' value = 0
% If you want an exponential Curve fitting, set 'approach' value = 1
approach = 0;


%% SCRIPT SECTION
% Uncomment next line if you want to export coefficients to Command Window
% global fun coefficients

if approach ~= 0
   m = 1;
end
A = zeros(m+1,m+1); 
B = zeros(m+1,1);


% Obtain the coefficients of the polynomial regression
for k = 1:1:m+1
   for j = 1:1:m+1
      A(k,j) = sum( Dados(:,1).^(k+j-2));
   end
   if approach == 0
      B(k,1) = sum( (Dados(:,1).^(k-1)).*Dados(:,2));
   else
      B(k,1) = sum( (Dados(:,1).^(k-1)).*log(Dados(:,2)));
   end
end
coefficients = A\B; 

fun = 0;
if approach == 0
   % Writting the polynomial fun = a0 + a1x + a2x2 + ...
   for k = 1 : 1 : m+1
      fun = fun + double(coefficients(k, 1)) * x^(k-1);
   end
else
   % Writting the polynomial fun = a*exp(b*x)
   fun = exp(coefficients(1,1)) * exp(coefficients(2,1)*x);
end
    
% Estimating the error
Sr = 0; St = 0;
for k = 1 : 1 : size(Dados,1)
Sr = Sr + ( Dados(k,2) - subs(fun,x,Dados(k,1)) )^2 ;
St = St + ( Dados(k,2) - mean(Dados(:,2)) )^2;
end
r2 = (St-Sr)/St;
r = sqrt(r2);
 
  
%% OUTPUT SECTION
% Export graphic to Command window
minValue = floor(min(Dados(1,1) - Dados(2,1)*0.5, min(Dados(:,1)*0.65)));
maxValue = ceil(min( Dados(length(Dados), 1) + abs(min(Dados(1,1) - Dados(2,1))), max(Dados(:,1)*1.05)));  
ezplot(fun, [minValue maxValue]);  hold on; grid on
scatter(Dados(:,1), Dados(:,2))
hold off

% Print the output in the Command window
vpa(fun, 10)
sprintf('Standard Error Sr = %.5f \nCorrelation Coefficient r = %.5f \nCoefficient of determination r^2 = %.5f', Sr, r, r2 )

end
