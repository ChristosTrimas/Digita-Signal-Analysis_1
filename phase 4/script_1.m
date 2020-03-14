%lab 4
%

clear all;
close all;
clc

gamma = 1*1000000000;

[A,map] = imread('astro.bmp');
A1 = rgb2gray(A);

[M,N] = size(A1);

figure;
imshow(A);
title('Original Image');

H_1 = fspecial('average',[5 5]);
filtered_Image = imfilter(A1,H_1);
mean = 0;
prompt = 'Enter variance(value between 0-1):';                   
variance = input(prompt);

Image_noised = imnoise(filtered_Image,'gaussian',mean,variance);

figure;
imshow(Image_noised);
title('Noised Image');

G_1 = fft2(Image_noised,M,N);
H_conj = conj(fft2(H_1,M,N));
squared_H = abs(fft2(H_1,M,N)).^2;
S_n_1 = variance;
S_f = abs(fft2(A1)).^2;

F_1 = (H_conj./(squared_H + gamma*(S_n_1./S_f))).*G_1;
f_1 = ifft2(F_1);

figure;
subplot(1,3,1);
imshow(A);
title('Astro Simpsons Image');
subplot(1,3,2);
imshow(Image_noised);
title('Image with noise');
subplot(1,3,3)
imshow(f_1,[min(min(f_1)) max(max(f_1))]);
title('Restored with Wiener filter');

mse_1 = sqrt(sum(sum((double(A1) - double(f_1)) .^2))) / (M * N)
