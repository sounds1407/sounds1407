clc;
clear all;
close all;
load proper1.mat;
load label.mat;

[file,path]=uigetfile([path '\' '*.jpg']);
camera_data = imread([path '\' file]);
figure(1);
imshow(camera_data);

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
Result_final = {bw4};
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
   img_crop1 = imresize(img_crop,[256 256]);
   img_crop2 = rgb2gray(img_crop1);
   
   for train_data = 1:size(proper1,2)
      proper2 =  proper1{train_data};
     Res(train_data) = corr2(img_crop2,proper2);
   end
   [Res,INDEX]=max(Res);
    Result = k1{INDEX};
    Result_final{i} = Result;
    
end
rr = cell2mat(Result_final)
msgbox(rr)


tts(rr);
         
         pause(3);
          w = tts(rr,[],-4,44100);
