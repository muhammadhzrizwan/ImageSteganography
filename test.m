clear all
close all
clc

% no='stg_img';
im='img.jpg';
mes='my^name(is- hamza* rizwan';
psw = [3 6 1 4 5 2];
% h=1280;
% w=960;
key = 3;

% stego(mes,psw,key,im,no,h,w);
stego(mes,psw,key,im);

I='stg_img';
P = [3 6 1 4 5 2];
K = 3;

M=unstego(I,P,K);