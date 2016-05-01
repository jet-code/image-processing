clc; clear; close all;
% ECE 6397 Matlab project
% Q2

%2d
I = load('6397.mat');
figure(1)
image(I.IM6397)

q = [100,200,500,750,900];
H = zeros(1,length(q));
MSE = zeros(1,length(q));

for m = 1:length(q)
[zAr,zHr,zVr,zDr] = encoder_2d(I.IM6397(:,:,1),q(m));
[zAg,zHg,zVg,zDg] = encoder_2d(I.IM6397(:,:,2),q(m));
[zAb,zHb,zVb,zDb] = encoder_2d(I.IM6397(:,:,3),q(m));

Ir = decoder_2d(zAr,zHr,zVr,zDr,q(m));
Ig = decoder_2d(zAg,zHg,zVg,zDg,q(m));
Ib = decoder_2d(zAb,zHb,zVb,zDb,q(m));

figure(m+1)
temp_title = sprintf('Decoded image for q = %5.3f',q(m));
imshow(cat(3,Ir,Ig,Ib))

end












