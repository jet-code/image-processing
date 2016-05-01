function djcj = dwtcc(x,h,g,T)
% dwt computes c_j[k] and d_j[k] for the discrete wavelet
% transform of signal x
% x is an even length vector
% h and g are the digital filters
% T is the interval of support for signal x

N = length(x);
J1 = log2(N/T);
djcj = zeros(J1+1,N/2);

% reverse order of h and g for h[-k] and g[-k]
h = h(end:-1:1);
g = g(end:-1:1);

c_J1 = (2^(-J1/2))*x;
m = 0;
c_jp1 = c_J1;

for j = (J1-1):-1:1
    m = m+1;
    L = N/(2^(m-1));
    dj = circular_conv(c_jp1,g);
    cj = circular_conv(c_jp1,h);
    djcj(m,1:L/2) = [dj(3:2:L),dj(1)];
    c_jp1 = cj(1:2:L);
    
end

m = m+1;
L = N/(2^(m-1));
dj = circular_conv(c_jp1,g);
cj = circular_conv(c_jp1,h);
djcj(m,1:L/2) = dj(1);
c_jp1 = cj(1:2:L);


m = m+1;
djcj(m,1:L/2) = c_jp1;















