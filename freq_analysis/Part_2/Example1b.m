%0606085
clc; clear all; close all;

x1 = [1 2 2 0];
x2 = [1 2 3 4];
n = [0 1 2 3];
y = gallery('circul',x2)'*x1';
subplot(3,1,1),stem(n,x1)
subplot(3,1,2),stem(n,x2)
subplot(3,1,3),stem(n,y)