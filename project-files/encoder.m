function z = encoder(x,h,g,T,q)
% Encoder performs uniform scalar quantization on the DWT of signal x.
% x is an even length vector
% h and g are the digital filters
% T is the interval of support for signal x
% q is the step size of the quantizer.

y = dwtcc(x,h,g,T);
z = round((1/q)*y);
