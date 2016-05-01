function h_j = haar2(x,T)
% Haar wavelet system
% x is the input signal.
% T is the interval of support
% J1 is the scale of the final space V_J1
% haar returns matrix h_j. The first row is h_tilde for the approximation
% in V_0. The second row is h_hat_0 for the projection into W_0. Subsequent
% rows are h_hat_1,..., h_hat_J1-1 corresponding to projections into
% W_1,..., W_J1-1. The rows can be summed to get approximations in
% V_1,...,V_J1.

a = 1/sqrt(2);
h = [a,a]; % h[n]
g = [a,-a]; % g[n]

djcj = dwtcc(x,h,g,T);

[B,N] = size(djcj);
J1 = B-1;

h_j = zeros(B,2*N);
Ts = 1/(2*N-1);
t = [0:Ts:T];

% V_0
% c_0[k=0]
h_j(1,:) = djcj(B,1)*phi(t);


% W_J1-1, ..., W_0
m = 1;

for j = (J1-1):-1:0
    h_j_temp = zeros(1,2*N);
    for k = 0:(2^j - 1)
        h_j_temp = h_j_temp + djcj(m,k+1)*(2^(j/2))*psi((2^j)*t - k);
    end
    m = m+1;
    h_j(j+2,:) = h_j_temp;
end










