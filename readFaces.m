function readFaces(file)
	um=100;
	ustd=80;

	figure(1);
	%i = file

	%str=strcat(int2str(i),'.jpg');
	file;
	str = file;
	eval('img=imread(str);');
	%subplot(ceil(sqrt(numlines)),ceil(sqrt(numlines)),i)
	imshow(img);
	[irow icol]=size(img)
	temp=reshape(img',irow*icol,1);
