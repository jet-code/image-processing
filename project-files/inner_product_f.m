function u = inner_product_f(function_type,j,k,x,t)
% Computes inner product of functions (vector x is for a signal).
% x is a vector for the signal function
% t is the time vector for x
% j,k are indices for phi and psi
% function_type specifies function phi_j,k or psi_j,k
%  value must be string 'phi' or 'psi'
% u is either cj[k] for 'phi' or dj[k] for 'psi'

if (function_type == 'phi')
    phi_jk = (2^(j/2))*phi((2^j)*t - k);
    u = trapz((phi_jk.*x),t);  
    
elseif (function_type == 'psi')
    psi_jk = (2^(j/2))*psi((2^j)*t - k);
    u = trapz((psi_jk.*x),t);
    
else
    disp('error')
end
