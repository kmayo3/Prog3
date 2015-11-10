#! octave -qf
clc
pkg load image;
file_name = 'train.txt';

fileID = fopen(file_name, 'r');
faces = textread(file_name, "%s");
fclose(fileID);
r = rows(faces);
person(:,:)="";

for i = 1:r;

%%X = 
%%imagesc(X);
%%[m n] =size(faces);
%%img = file_name;
T = imread(strcat('train./',char(faces(i)))); 

%reshape into matrix
B = imagesc(reshape(T, 250,250));
colormap('gray');

%append to training

%%person(:,i) = T;
endfor
%define average
Average = mean(B, 2);
imshow(Average);

%%mean = (average/ n-1);
 %average = mean(A, 'r');
%compute covariance
%cov = x*y'
%%N = cov (x) = 1/N-1 * SUM_i (x(i) - mean(x)) * (y(i) - mean(y));

%compute a pca 
mu = mean(B,2);
Xm = bsxfun(@minus,double (B), mu);
C = cov(Xm);
[V,D] = eig(C);

% sort eigenvectors desc
[D, i] = sort(diag(D), 'descend');
V = V(:,i);

