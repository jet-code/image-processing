function x = inverseDWT(djcj,h,g)
% inverseDWT computes the inverse of the discrete wavelet
% transform for c_j[k] and d_j[k] input in djcj matrix
% x is an even length vector
% h and g are the digital filters
% T is the interval of support for signal x

[B,N] = size(djcj);
J1 = B-1;
Nx = 2*N;

c_jp1 = djcj(B,1);

for j = J1:-1:1
    
    L = Nx/(2^(j-1));
    dj = upsample(djcj(j,1:L/2),2);
    c_jp1 = upsample(c_jp1,2);
    c_jp1 = circular_conv(dj,g) + circular_conv(c_jp1,h);
    
end

x = (2^(J1/2))*c_jp1;
















