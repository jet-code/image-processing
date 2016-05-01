clc; clear; close all;
% ECE 6397 Matlab project
% Q2

%2c
x = (load('signal1.dat', '-ascii'));
N = length(x);
T = 1;

a = 1/sqrt(2);
h = [a,a]; % h[n]
g = [a,-a]; % g[n]

q = [0.001,0.002,0.005,0.01,0.02,0.05];
H = zeros(1,length(q));
MSE = zeros(1,length(q));

figure(1)

for m = 1:length(q)
    z = encoder(x,h,g,T,q(m));
    x_hat = decoder(z,h,g,q(m));
    
    temp_title = sprintf('Decoded x(t) for q = %5.3f',q(m));
    subplot(3,2,m);
    plot(x_hat)
    title(temp_title)
    xlabel('t seconds')
    ylabel('x(t)')
    axis([0 1024 -0.5 1.5])
    
    H(m) = entropy(z,q(m));
    MSE(m) = (1/N)*sum((x-x_hat).^2);
end

figure(2)
plot(MSE,H,'.--')
xlabel('MSE')
ylabel('Entropy H bits')

figure(3)
plot(q,H,'.--')
ylabel('Entropy H bits')
xlabel('q value')

figure(4)
plot(q,MSE,'.--')
ylabel('MSE')
xlabel('q value')










