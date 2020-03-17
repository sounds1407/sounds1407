
clc;
clear all;
close all;
path = cd;
path2 = 'E:\Barille_code_14_3_20\code_14_3_20\Train\cropped';
[file,path]=uigetfile([path '\' '*.jpg']);
img = imread([path '\' file]);
figure(1);
imshow(img);

crop = 5;

for i = 1 : crop
    crop_img1 = imcrop(img);
    imwrite(crop_img1,[path2 '\' 'img_' num2str(i) '.jpg']);
end

helpdlg('Completed');