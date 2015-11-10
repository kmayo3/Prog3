#! octave -qf
clc
pkg load image;
file_name = 'train.txt';

fileID = fopen(file_name, 'r');
faces = flist = textread(file_name, "%s");
fclose(fileID);
r = rows(faces);
person(:,:)="";

for i = 1;
C =[];
%%imagesc(faces);
T = imagesc(char(faces(i)));

%reshape into vectorize
B = imagesc(reshape(T, 250,250));
colormap('grey');

%append to training

person(:,i) = T;
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
mu = mean(X,2);
Xm = bsxfun(@minus,double (X), mu);
C = cov(Xm);
[V,D] = eig(C);

% sort eigenvectors desc
[D, i] = sort(diag(D), 'descend');
V = V(:,i);

