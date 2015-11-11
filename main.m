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
drawnow;
%compute covariance
% Change image for manipulation
covm=[];  % A matrix

%Covariance matrix C=A'A, L=AA'
A=covm';
L=A*A';

% vv are the eigenvector for L
% dd are the eigenvalue for both L and A
[vv dd]=eigs(L);

% Sort and eliminate those whose eigenvalue is zero
v=[];
d=[];

for i=1:size(vv,2)
if(dd(i,i)>1e-4)
v=[v vv(:,i)];
d=[d dd(i,i)];
end
endfor

%compute a pca 
mu = mean(B,2);
Xm = bsxfun(@minus,double (B), mu);
%%C = cov(Xm);


