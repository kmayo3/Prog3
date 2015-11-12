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

%% for loop which starts at first image of row
for i = 1:r;

%% append images
T = imread(strcat('train./',char(faces(i)))); 

%% reshape into matrix
B = imagesc(reshape(T, 250,250));

%% set colormap to gray 
colormap('gray');

%% ends the for loop
endfor


%% define average
Average = mean(T,2);
imshow(Average);
drawnow;

%%generate the eigenvectors and store them  
%% Covariance matrix A=covm', L=AA'
%%I2 converts image to double precision 
I2 = im2double(T);
A=(I2'*I2);
L=A*A';
Covm = [A, L];
imshow(Covm);

%%get eigenvectors of A and L and store into matrix Z
h = eigs(A);
j = eigs(L);

Z = [h, j];
imshow(Z);


%compute a pca 
X = bsxfun(@minus,double (T), Average);