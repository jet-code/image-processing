function [zA,zH,zV,zD] = encoder_2d(x,q)
% Encoder performs uniform scalar quantization on the DWT of signal x.
% q is the step size of the quantizer.

[cA,cH,cV,cD] = dwt2(x,'haar');
zA = round((1/q)*cA);
zH = round((1/q)*cH);
zV = round((1/q)*cV);
zD = round((1/q)*cD);
