function x = decoder_2d(zA,zH,zV,zD,q)
% Decoder performs inverse quantization on Q[DWT[x]] and then uses the
% q is the step size of the quantizer.

cA = q*zA;
cH = q*zH;
cV = q*zV;
cD = q*zD;
x = idwt2(cA,cH,cV,cD,'haar');

