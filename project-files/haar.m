function h_j = haar(h, J, fs)
% Haar wavelet system
% h is the input signal.
% J is the scale of the final space V_J
% fs is the sample frequency
% haar returns matrix h_j. The first row is h_tilde for the approximation
% in V_0. The second row is h_hat_0 for the projection into W_0. Subsequent
% rows are h_hat_1,..., h_hat_J-1 corresponding to projections into
% W_1,..., W_J-1. The rows can be summed to get approximations in
% V_1,...,V_J.

h_j = zeros(1+J,fs+1);
Ts = 1/fs;
t = [0:Ts:1];

% Vo
% c_0[k=0]
c_0 = inner_product_f('phi',0,0,h,t);
h_j(1,:) = c_0*phi(t);

% Wo
% d_0[k=0]
d_0 = inner_product_f('psi',0,0,h,t);
h_j(2,:) = d_0*psi(t);

% W1 ...
if (J > 1)
    for j = 1:(J-1)
        h_j_temp = zeros(1,fs+1);
        for k = 0:(2^j - 1)
            d_j = inner_product_f('psi',j,k,h,t);
            h_j_temp = h_j_temp + d_j*(2^(j/2))*psi((2^j)*t - k);
        end
        h_j(2+j,:) = h_j_temp;
    end
end










