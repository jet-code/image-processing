function H = entropy(z,q)
% entropy computes the entropy of coefficient matrix z[k]
% assumes bin is centered at zero and interval is -1 to 1

k = 2*(1/q) + 1;
[B,N] = size(z);
n = zeros(1,k);
num_elements = 0;

for m = 1:B
    [n_temp,xout] = hist(z(m,1:N),k);
    n = n + n_temp;
    num_elements = num_elements + N;
    N = N/2;
end

H = 0;

for i = 1:k
    p_i = n(i)/num_elements;
    if (p_i ~= 0)
    H = H + -1*p_i*log2(p_i);
    end
end
