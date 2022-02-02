% ======================================================================= %
% SCRIPT NAME : FourierSerie
% DESCRIPTION : Generates a trigonometric series to represent infinite or 
%               periodic functions
% AUTHOR      : Victor Hugo Dalosto de Oliveira
% EMAIL       : victordalosto@gmail.com
% Copyright @ 2018 Victor Hugo Dalosto de Oliveira. All rights reserved.
% ======================================================================= %


function FourierSerie
%% INPUT SECTION
syms x

F = x^3;   % Input F function
L = 10/2;  % Interval = (Overall Range)/2
m = 50;    % Number of terms


%% SCRIPT SECTION
% Uncomment next line if you want to export the function fun to Command Window
% global fun

a0 = (1/L)*int(F, -L, L);
an = zeros(m,1);
bn = zeros(m,1);

% Find the coefficients of Fourier Function
for n = 1:1:m
   an(n,1) = (1/L)*int(F*cos(n*pi*x/L), x, -L, L);
   bn(n,1) = (1/L)*int(F*sin(n*pi*x/L), x, -L, L);
   % Uncomment next two line to change from Analytical to Numerical approach
   % an(n,1) = (1/L)* quadgk(@(x) x.^3.*cos(n*pi*x/L), -L, L);
   % bn(n,1) = (1/L)* quadgk(@(x) x.^3.*sin(n*pi*x/L), -L, L);
end

% Sum of functions values
fun = a0/2;
for n = 1:1:m
   fun = fun + an(n,1)*cos(n*pi*x/L);
   fun = fun + bn(n,1)*sin(n*pi*x/L);
end


%% OUTPUT SECTION
% Export graphic to Command window
ezplot(fun,round(-L*5),round(L*5)); grid on
% Print the output in the Command window
vpa(fun,6)

end
