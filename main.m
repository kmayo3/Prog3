#! octave -qf
pkg load image

fid = fopen('./Train/train.txt', 'r');
if (fid < 0)
	printf('Error: could not open file\n')
else
	while ~feof(fid),
		s=[]
		line = fgetl(fid);
		path = './Train/'
		line = strcat(path,line)
		line
		readFaces(line) >> test.txt;
	end
	fclose(fid)
end
