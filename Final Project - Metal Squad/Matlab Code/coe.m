% Create .coe file from .jpg image
% .coe file contains 8-bit words (bytes)
% each byte contains one 8-bit pixel
% color byte: [R2,R1,R0,G2,G1,G0,B1,B0]
% img2 = IMG2coe8(imgfile, outfile)
% img2 is 8-bit color image
% imgfile = input .jpg file
% outfile = output .coe file
% Example:
% img2 = IMG2coe8('loons240x160.jpg', 'loons240x160.coe');
clc
[img, map] = imread('ko.png');
%img(354:700,:) = img(622:968,:);
img = img(:,:,:);
[img,map] = rgb2ind(img, 256);
%imshow(img)
%img=[0 1 2 3;4 5 6 7;8 9 10 11;12 13 14 15]
[M N]=size(img);
s=fopen('ko.coe', 'w+');
%fileID = fopen('ryu_reduced_odd.bin','w+');
%opens the output file
fprintf(s,'%s\n','; VGA Memory Map ');
fprintf(s,'%s\n','; .COE file with hex coefficients ');
fprintf(s,'; Height: %d, Width: %d\n\n', M, N);
fprintf(s,'%s\n','memory_initialization_radix=16;'); 
fprintf(s,'%s\n','memory_initialization_vector=');
cnt = 0;
img2 = img;
%Rb = dec2hex(img,1)
%P =size(Rb)
val = 0;
%fwrite(fileID,val); % bin file
for i=1:M
    for j=1:N
cnt = cnt + 1;
R = ceil(map(img(i,j) + 1,1) * 7); % convert to 8bit RGB
G = ceil(map(img(i,j) + 1,2) * 7);
B = ceil(map(img(i,j) + 1,3) * 3);
%R = img(i,j,1); % convert to 8bit RGB
%G = img(i,j,2);
%B = img(i,j,3);
val = R * 32 + G * 4 + B;
fprintf(s,'%X', val); % coe file
%fwrite(fileID,val); % bin file
if (i ==M && j==N) 
fprintf(s,'%c',';');
else fprintf(s,'%c\n',',');
end
%if(mod(cnt,32) == 0)
%fprintf(s,'%c\n',',');
%else

    end 
end
%end
fclose(s);
%fclose(fileID);