% ======================================================================= %
% SCRIPT NAME : Interpolation_Newton
% DESCRIPTION : Interpolation using a numerical approach, with polynomial 
%               coefficients found by Divided difference
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function Interpolation_Newton
%% INPUT SECTION
syms x

x_values = [1.1 2.1 3.5 4.1  5.5  6.1   7.0  8.1  9.0  10.1 11.0];
y_values = [5.5 9.0 13  15.1 17.5 17.45 17.8 18.1 18.4 18.9 19.5];

% The Input format is a size [n,2] matrix 'Dados', where:
Dados(:,1) = x_values;  % [n,1] = x
Dados(:,2) = y_values;  % [n,2] = f(x) = y


%% SCRIPT SECTION
% Uncomment next line if you want to export fun to Command Window
% global fun

P = zeros(size(Dados,1),size(Dados,1));
P(1,:) = Dados(:,2);

% Calculates the coefficients by Divided difference
for k = 2:1:size(Dados,1)
   for j = 1:1:size(Dados,1)-k+1
      P(k,j) = (P(k-1,j+1) - P(k-1,j)) / (Dados(k+j-1,1) - Dados(j,1));
   end
end

fun = P(1,1);
xterm = 1;
  
% Construction of the Polynomial 
for order = 1:1:(size(Dados,1) - 1)
   xterm = xterm*(x - Dados(order,1));
   fun = fun + P(order+1,1)*xterm;
end


%% OUTPUT SECTION
% Export graphic to Command window
minValue = floor(min(Dados(1,1) - Dados(2,1)*0.5, min(Dados(:,1)*0.65)));
maxValue = ceil(min( Dados(length(Dados), 1) + abs(min(Dados(1,1) - Dados(2,1))), max(Dados(:,1)*1.05)));  
ezplot(fun, [minValue maxValue]);  hold on; grid on
scatter(Dados(:,1), Dados(:,2));
hold off

% Print the output in the Command window
vpa(simplify(fun), 10)

end
