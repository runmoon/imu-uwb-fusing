function [num,den] = design_butterws_filter( which , n, fs, fc )
%  ??butterworth filter?which???????
%  n: order of the filter
%  fs: simple frequency
%  fc: boundary frequency
 
if which == 1
    
% mathod 1: impluse invariance transformation
[b,a] = butter(n, 2*pi*fc,'s');  % ??????????????
[num1,den1] = impinvar(b,a,fs);  % ?????????????????????
num = num1;
den = den1;
else
    
% mathod 2: bilinear transformation
[b,a] = butter(n, 2*fs*tan(2*pi*fc/(2*fs)), 's');  % ?????
[num2,den2] = bilinear(b,a,fs);  % ????????????????????
num = num2;
den = den2;
end
 
end
 
 