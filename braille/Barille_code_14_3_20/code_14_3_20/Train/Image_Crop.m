
clc;
clear all;
close all;
path = cd;
path1 = 'E:\Barille_code_14_3_20\code_14_3_20\Train\cropped';
path2 = 'E:\Barille_code_14_3_20\code_14_3_20\Train\cropped_Images';

folinfo = dir([path1]);

for MIdx = 1:size(folinfo,1)
    if ~strcmp(folinfo(MIdx).name,'.') && ~strcmp(folinfo(MIdx).name,'..') && ~strcmp(folinfo(MIdx).name,'Thumbs.db') && isempty(strfind(folinfo(MIdx).name,'.txt'))  
%         camera_data = imread('b1.jpg');
        img_Ori_name = folinfo(MIdx).name;
        camera_data = imread([path1 '\' img_Ori_name]);
        figure(1);imshow(camera_data);
        camera_data1 = rgb2gray(camera_data);
        figure(2);imshow(camera_data1);
        camera_data2 = im2bw(camera_data1,0.8);
        figure(3);imshow(~camera_data2);
        [bw1,bw2]=bwlabel(~camera_data2);
        stat1 = regionprops(bw1);
        Hori_line = imopen(~camera_data2,strel('line',30,0));
        figure(4);imshow(Hori_line);
        Vert_line = imopen(~camera_data2,strel('line',20,90));
        figure(5);imshow(Vert_line);
        [bw3,bw4]=bwlabel(Vert_line);
        stat2 = regionprops(bw3);
        for i = 1:(bw4-1)
            if i == 1
                st1 = stat2(1).BoundingBox(1);
                st2 = stat2(2).BoundingBox(1);
                width = st2 - st1; 
            end
            st_row = stat2(i).BoundingBox(1);
            st_col = stat2(i).BoundingBox(2);
            st_hei =  stat2(i).BoundingBox(4);
           img_crop = imcrop(camera_data,[st_row st_col width st_hei]);
           imwrite(img_crop,[path2 '\' 'crop_' img_Ori_name(1:end-4) '_' num2str(i) '.jpg']);
        end
    end
end  
