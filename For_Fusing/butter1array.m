function [ y ] = butter1array( x, fs, fc)
%  ????????????????x?????????y
% fs??????fc?????
%  wc??????T?????
 
size_x = size(x);
% order = 1;  % ?????
order = 2;  % ?????
%  order = 3;  % ?????
[a1,b1] = design_butterws_filter(2, order, fs, fc);
for n = 1 : size_x(2)
    if n <= order
        y(n) = x(n);
    else
%        y(n) = a1(1) * x(n) + a1(2) * x(n-1) - b1(2) * y(n-1);  % 1?
        y(n) = a1(1) * x(n) + a1(2) * x(n-1) + a1(3) * x(n-2) - b1(2) * y(n-1) - b1(3) * y(n-2); % 2?
%        y(n) = a1(1) * x(n) + a1(2) * x(n-1) + a1(3) * x(n-2) + a1(4) * x(n-3) - b1(2) * y(n-1) - b1(3) * y(n-2) - b1(4) * y(n-3); % 3?   % 3?
    end
end
end
 