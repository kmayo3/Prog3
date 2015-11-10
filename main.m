%% clear everything before it is run
clc
clear all
clf

 %% image package
pkg load image;

%% set file name to the train.txt file
file_name = 'train.txt';

%% open and read the train file 
fileID = fopen(file_name, 'r');

%% reads in the names 
faces = textread(file_name, "%s");

%% close the file 
fclose(fileID);

%% set r to the rows of the name
r = rows(faces);

%% reads the whitespace
person(:,:)= "";

%% for loop which starts at first image of row
for i = 1:r;

%% Append images
T = imread(strcat('train./',char(faces(i)))); 

%% reshape into matrix
B = imagesc(reshape(T, 250,250));

%% set colormap to gray 
colormap('gray');

%% ends the for loop
endfor


%define average
Average = mean(B, 2);
imshow(Average);

%%mean = (average/ n-1);
%%average = mean(A, 'r');
 
%compute covariance
%cov = x*y'
%%N = cov (x) = 1/N-1 * SUM_i (x(i) - mean(x)) * (y(i) - mean(y));
C = B' * B;
[L,V] = eig(C);
[L,V] = eigs(C,r);
F = B * B';
G = eigs(F);

%compute a pca 
mu = mean(B,2);
Xm = bsxfun(@minus,double (B), mu);
%%C = cov(Xm);
[V,D] = eig(C);

% sort eigenvectors descend
[D, i] = sort(diag(D), 'descend');
V = V(:,i);

