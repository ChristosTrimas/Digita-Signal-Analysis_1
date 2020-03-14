clear all;
close all;
clc

A_1 = zeros(256,256);
A_2 = zeros(256,256);

A_1(256/2 - 5:256/2 + 5,256/2 - 5:256/2 + 5) = 255;  %255 = white 10x10
A_2(256/2 - 15:256/2 + 15,256/2 - 15:256/2 + 15) = 255; %30x30

figure;
imshow(A_1);
title('White center 10x10');

figure;
imshow(A_2);
title('White center 30x30');

F_1 = abs(fftshift(fft2(A_1)));
F_2 = abs(fftshift(fft2(A_2)));

F1 = 17*(log(1+F_1));
figure;
colormap(gray(256));
image(F1);
title('Gray Fourier for 10x10 window');

F1 = 17*(log(1+F_1));
figure;
colormap(jet(256));
image(F1);
title('Colored Fourier for 10x10 window');

F2 = 17*(log(1+F_2));
figure;
colormap(gray(256));
image(F2);
title('Gray Fourier for 30x30 window');

F2 = 17*(log(1+F_2));
figure;
colormap(jet(256));
image(F2);title('Colored Fourier for 30x30 window');
