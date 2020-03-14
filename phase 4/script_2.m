clear all;
close all;
clc

gamma = 80;

[A1,map] = imread('astro.bmp');
A = rgb2gray(A1);
[M,N] = size(A);

H = fspecial('average',[5 5]);
filtered = imfilter(A,H);
mean = 0;
prompt = 'Enter variance:';  
variance = input(prompt);
Image_noised = imnoise(filtered,'gaussian',mean,variance);

M_1 = M + 2;                        %3-1
N_1 = N + 2;
P = [0 -1 0; -1 4 -1; 0 -1 0];
squared_P = abs(fft2(P,M_1,N_1)).^2;
H_1 = fft2(H,M_1,N_1);
H_1_con = conj(fft2(H,M_1,N_1));
squared_H_1 = abs(fft2(H,M_1,N_1)).^2;
G  = fft2(Image_noised,M_1,N_1);
g = ifft2(G);

F = (H_1_con./(squared_H_1 + gamma .*squared_P)).*G;
f = ifft2(F);

squared_r = norm(g - H_1.*f,1)^2;
squared_n = (M_1 - 1)*(N_1 - 1)*(variance^2);

a = 0.01*squared_n;
i = 0;
while(i<6)
    if squared_r < squared_n - a
        gamma = gamma + 5;
    end;
    if squared_r > squared_n +a
        gamma = gamma - 5;
    end;
    F = (H_1_con./(squared_H_1 + gamma .*squared_P)).*G;
    f = ifft2(F);
    squared_r = norm(g - H_1.*f,1)^2;
    i = i + 1;
end;

figure;
subplot(1,3,1);
imshow(A);
title('Original Image');
subplot(1,3,2);
imshow(Image_noised);
title('Image with noise');
subplot(1,3,3);
imshow(f,[min(min(f)) max(max(f))]);
title('Restored Image with CLSR');

mse = immse(padarray(A,[1,1]),uint8(f))