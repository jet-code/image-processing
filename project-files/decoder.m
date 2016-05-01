function x = decoder(z,h,g,q)
% Decoder performs inverse quantization on Q[DWT[x]] and then uses the
% inverse DWT to synthesize signal x.
% z is Q[DWT[x]]
% h and g are the digital filters
% T is the interval of support for signal x
% q is the step size of the quantizer.

y_hat = q*z;
x = inverseDWT(y_hat,h,g);

