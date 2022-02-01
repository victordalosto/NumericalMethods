% ======================================================================= %
% SCRIPT NAME : CurveFitting
% DESCRIPTION : Find a curve that best fit a serie of data points
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function CurveFitting
%% INPUT SECTION
syms x

% Input data is a sized nx2 Matrix Dados[n,2] where:
% Dados[n,1]=x   and   Dados[n,2]=f(x)
Dados = [50	28.2
1050	658.8
5050	2800
10050	6300
15050	9300
20050	11800
25050	15500
30050	17800
35050   19400];

% Polynomal degree to be exported
m = 3;
% If you want a polynomal Curve fitting approach set next value = 0
% If you want a exponential Curve fitting, set next value = 1
approach = 0;


%% SCRIPT SECTION
% Uncomment next line if you want to export fun and coef to Command Window
% global fun coeficientes

if approach == 1
   m = 1;
end
n = size(Dados,1); 
A = zeros(m+1,m+1); B = zeros(m+1,1);


% Obtain the coefficients of polinomial regression
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
coeficientes = A\B; 

fun = 0;
if approach == 0
   % Writting the polynomial fun = a0 + a1x + a2x2 + ...
   for k = 1 : 1 : m+1
      fun = fun + double(coeficientes(k, 1)) * x^(k-1);
   end
else
   % Writting the polynomial fun = a*exp(b*x)
   fun = exp(coeficientes(1,1)) * exp(coeficientes(2,1)*x);
end
    
% Estimating the error
Sr = 0; St = 0;
for k = 1 : 1 : n
Sr = Sr + ( Dados(k,2) - subs(fun,x,Dados(k,1)) )^2 ;
St = St + ( Dados(k,2) - mean(Dados(:,2)) )^2;
end
r2 = (St-Sr)/St;
r = sqrt(r2);
 
  
%% OUTPUT SECTION
% Export graphic to Command window
minValue = floor(min(Dados(1,2) - Dados(2,2), min(Dados(:,1)*0.65)));
maxValue = ceil(min( Dados(length(Dados), 2) + abs(min(Dados(1,2) - Dados(2,2))), max(Dados(:,1)*1.05)));  
ezplot(fun, minValue, maxValue);  hold on; grid on
scatter(Dados(:,1),Dados(:,2))
hold off

% Print the output in Command window
vpa(fun,10)
sprintf('Erro Padrão da estimativa Sr = %.5f \nCoeficiente de correlação  r = %.5f \nCoeficiente de determinação r² = %.5f', Sr, r, r2 )

%clearvars x Dados m approach n A Sr St r2 r minValue maxValue

end

