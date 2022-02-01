% ======================================================================= %
% SCRIPT NAME : Interpolation_Newton
% DESCRIPTION : Interpolation using a numerical approach with polynomial 
%               coefficients found by difference divided
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function Interpolation_Newton
%% INPUT SECTION
syms x

% Input data is a sized nx2 Matrix Dados[n,2] where:
% Dados[n,1]=x   and   Dados[n,2]=f(x)
Dados = [1 1
    2 3
    3 5
    4 7
    5 69];


%% SCRIPT SECTION
% Uncomment next line if you want to export fun to Command Window
% global fun

n = size(Dados,1) - 1;
P = zeros(n+1,n+1);
P(1,:) = Dados(:,2);

% Calculate the coefficients by difference divided
for k = 2:1:n+1
   for j = 1:1:(n-k)+2
      P(k,j) = (P(k-1,j+1) - P(k-1,j)) / (Dados(k+j-1,1) - Dados(j,1));
   end
end

fun = P(1,1);
xterm = 1;
  
% Construction of the Polynomial
for order = 1:1:n
   xterm = xterm*(x - Dados(order,1));
   fun = fun + P(order+1,1)*xterm;
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
vpa(simplify(fun),12)

% clearvars x Dados n P xterm minValue maxValue

end

