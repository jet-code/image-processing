clc; clear; close all;
% ECE 6397 Matlab project
% Q1

%1a
h = (load('signal1.dat', '-ascii'));
N = length(h);

fs = 1023;
Ts = 1./fs; % period for sampling freq f = 1023 Hz
t = [0:Ts:1];
figure(1)
plot(t,h)
xlabel('t seconds');
ylabel('h(t)');

%b
% inner product function and Haar function

%c
% For signal h(t), h_tilde and h_hat are plotted for j=0,1,...,6
J = 7;
h_j = haar(h, J, fs);

figure(2)

for v = 0:3
    temp_title = sprintf('Projection in W_%d',v);

    subplot(2,2,v+1);
    plot(t,-1*h_j(v+2,:));
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
end

figure(3)

for v = 4:(J-1)
    temp_title = sprintf('Projection in W_%d',v);

    subplot(2,2,v-3);
    plot(t,-1*h_j(v+2,:));
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
end

figure(4)
h_j_temp = zeros(1,N);

for v = 0:3
    h_j_temp = h_j_temp + h_j(v+1,:);
    temp_title = sprintf('Approximation in V_%d',v);

    subplot(2,2,v+1);
    plot(t,-1*h_j_temp);
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
end

figure(5)

for v = 4:J
    h_j_temp = h_j_temp + h_j(v+1,:);
    temp_title = sprintf('Approximation in V_%d',v);

    subplot(2,2,v-3);
    plot(t,-1*h_j_temp);
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
end

%d
% Plot signal2.dat and filter1.dat

signal2 = (load('signal2.dat', '-ascii'));
filter1 = (load('filter1.dat', '-ascii'));

figure(6)
plot(signal2)
axis([0 300 0 1.5])
title('signal2')

figure(7)
plot(filter1)
title('filter1')

%e
% circular convolution function

%f
% plot linear convolution of signal2 and filter1
z_linear = conv(signal2,filter1);

figure(8)
plot(z_linear)
title('Linear convolution of signal2 and filter1')

% plot circular convolution of signal2 and filter1
z_circ = circular_conv(signal2,filter1);

figure(9)
plot(z_circ)
title('Circular convolution of signal2 and filter1')

%g
% 

T = 1;
h_j = haar2(h,T);

figure(10)
m = 1;
for v = 0:3
    temp_title = sprintf('Projection in W_%d',v);

    subplot(2,2,m);
    plot(t,h_j(v+2,:));
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
    m = m+1;
end

figure(11)
m = 1;
for v = 4:7
    temp_title = sprintf('Projection in W_%d',v);

    subplot(2,2,m);
    plot(t,h_j(v+2,:));
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
    m = m+1;
end

figure(12)
m = 1;
for v = 8:9
    temp_title = sprintf('Projection in W_%d',v);

    subplot(1,2,m);
    plot(t,h_j(v+2,:));
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
    m = m+1;
end
    
figure(13)
h_j_temp = zeros(1,N);
m = 1;
for v = 0:3
    h_j_temp = h_j_temp + h_j(v+1,:);
    temp_title = sprintf('Approximation in V_%d',v);

    subplot(2,2,m);
    plot(t,h_j_temp);
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
    m = m+1;
end

figure(14)
m = 1;
for v = 4:7
    h_j_temp = h_j_temp + h_j(v+1,:);
    temp_title = sprintf('Approximation in V_%d',v);

    subplot(2,2,m);
    plot(t,h_j_temp);
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
    m = m+1;
end

figure(15)
m = 1;
for v = 8:10
    h_j_temp = h_j_temp + h_j(v+1,:);
    temp_title = sprintf('Approximation in V_%d',v);

    subplot(2,2,m);
    plot(t,h_j_temp);
    title(temp_title);
    xlabel('t seconds')
    ylabel('h_j (t)');
    m = m+1;
end









