% Author: Daniel Serrano Torres, Emilio Álvarez Piñeiro

clear all; close all;

%%

rgb = ones(9,9,3) * 255;
rgb = uint8(rgb);
%% variables

%% imagen roja

R = rgb;
R(:,:,1) = 255;
R(:,:,[2 3]) = 0;

figure(1); imshow(R); title('imagen roja');

%%

%% imagen verde

V = rgb;
V(:,:,2) = 255;
V(:,:,[1 3]) = 0;

figure(2); imshow(V); title('imagen verde');

%%

%% imagen azul

A = rgb;
A(:,:,3) = 255;
A(:,:,[1 2]) = 0;

figure(3); imshow(A); title('imagen azul')
%%

%% imagen amarillo

M = rgb;
M(:,:,[1 2]) = 255;
M(:,:,3) = 0;

figure(4); imshow(M); title('imagen amarilla')
%%
%% imagen magenta

Ma = rgb;
Ma(:,:,[1 3]) = 255;
Ma(:,:,2) = 0;

figure(5); imshow(Ma); title('imagen Magenta')
%%
%% imagen cyan

C = rgb;
C(:,:,[2 3]) = 255;
C(:,:,1) = 0;

figure(6); imshow(C); title('imagen cyan')
%%
%% imagen cyan

G = rgb;
G(:,:,[1 2 3]) = 128;


figure(7); imshow(G); title('imagen gris')
%%
%% imagen blanco

Bl = rgb;
Bl(:,:,[1 2 3]) = 255;


figure(8); imshow(Bl); title('imagen blanco')
%%
%% imagen blanco

N = rgb;
N(:,:,[1 2 3]) = 0;


figure(9); imshow(N); title('imagen negro')
%%

%% Transformacion de color

img = imread('Tema03b','jpg');

% Reducción de la dimensionalidad
Rr = img(1:4:end,1:4:end,[1 2 3 ]);
figure(10); imshow(Rr); title('Dimensionalidad reducida'); impixelinfo;

% RGB
R = Rr(:,:,1);
G = Rr(:,:,2);
B = Rr(:,:,3);

figure(11); imshow(R);
figure(12); imshow(G);
figure(13); imshow(B);

% Formato CMY
d = size(Rr);
CMI = (uint8(ones(d(1),d(2),d(3))) * 255) - Rr;


figure(14); imshow(CMI);

% Formato YIQ
[M,N,s] = size(Rr);
T=[0.299 0.587 0.114; 0.596 -0.275 -0.321; 0.212 -0.523 0.311];

for i=1:1:M
    for j=1:1:N
      YIQ(i,j,1) = T(1,1)*R(i,j)+T(1,2)*G(i,j)+T(1,3)*B(i,j); 
      YIQ(i,j,2) = T(2,1)*R(i,j)+T(2,2)*G(i,j)+T(2,3)*B(i,j); 
      YIQ(i,j,3) = T(3,1)*R(i,j)+T(3,2)*G(i,j)+T(3,3)*B(i,j); 
    end
end
    
subplot(2,3,1); imshow(Rr); title('Original');
subplot(2,3,2); imshow(YIQ(:,:,1));     title('Y');
subplot(2,3,3); imshow(YIQ(:,:,2));     title('I');
subplot(2,3,4); imshow(YIQ(:,:,3));     title('Q');

subplot(2,3,5) ; imshow(YIQ); title('YIQ');
%figure(15); imshow(YIQ);
%%
