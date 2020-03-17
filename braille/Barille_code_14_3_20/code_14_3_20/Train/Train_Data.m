clc;
clear all;
close all;

    path='E:\Barille_code_14_3_20\code_14_3_20\Train\Train_images';
     Temp = '01';

j=1;
% k=zeros(length(Temp),1);
inc=0;
proper=zeros(65536,1);
proper1 ={65536,1};
for tot=1:1%length(Temp)
    
    if tot==1
       Path='E:\Barille_code_14_3_20\code_14_3_20\Train\Train_images'; 
    end
    folinfo = dir([Path]);
    k1={size(folinfo,1)};
 for MIdx = 1:length(folinfo)
     if ~strcmp(folinfo(MIdx).name,'.') && ~strcmp(folinfo(MIdx).name,'..') && ~strcmp(folinfo(MIdx).name,'Thumbs.db') && isempty(strfind(folinfo(MIdx).name,'.txt'))  
     d = dir([Path '\' folinfo(MIdx).name '\*.jpg']);
%     d = dir([Path  '\*.jpg']);
%     mkdir(TargetPath,folinfo(MIdx).name);
%     mkdir(NoiseImgPath,folinfo(MIdx).name);
     folinfo(MIdx).name
    for ii = 1:size(d,1)
%         if ii<=10
        ImgPath = [Path '\' folinfo(MIdx).name  '\' d(ii).name];
        img1 = imread(ImgPath);
        img2=imresize(img1,[256 256]);
        img=rgb2gray(img2);
        img_gray = img;
        img1D=img(:);
            proper(:,j)=img1D;
            proper1{:,j} = img_gray;
            j=j+1;

    end
    inc=inc+1;
     k(inc,1)=size(d,1);
     k1{inc,1} =  folinfo(MIdx).name;
    
 end
 end
end
save  data_Alphabet.mat proper;
save  nsamples_Alphabet.mat k;
save proper1 proper1;
save label.mat k1;





