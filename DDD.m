clear;

load('test.mat')
% se1 = strel('disk', 2);
% se2 = strel('disk',3);
H1 = fspecial('average');
for i = 1:179
    figure(1)
    image = I.image{i};
    crop1 = imcrop(image, [(RE(i,:) - [13,7]) 22 13]);
    crop2 = imcrop(image, [(LE(i,:) - [11,7]) 22 13]);
    crop = [1.2*crop1(:,:,2) zeros(14, 5) 0.9*crop2(:,:,2)];
    crop = imadjust(crop, [0.3 0.75], [],1.75);
    crop = imfilter(crop, H1);
    sharp_crop = (crop);
    %sharp_crop = imadjust(sharp_crop, [0.2, 0.6], []);
    subplot(2,2,1)
    imshow(image)
    subplot(2,2,2)
    imshow(sharp_crop);
    subplot(2,2,4)
    imhist(sharp_crop);
    subplot(2,2,3)
    [histVal, pixVal] = imhist(sharp_crop);
    avg(i) = sum(histVal.*pixVal)/sum(histVal);
    i
    plot(avg)
%     pause;
end 
%%
for i = 180:349
    figure(2)
    image = I.image{i};
    crop1 = imcrop(image, [(RE(i,:) - [13,7]) 22 13]);
    crop2 = imcrop(image, [(LE(i,:) - [11,7]) 22 13]);
    crop = [1.2*crop1(:,:,2) zeros(14, 5) 0.9*crop2(:,:,2)];
    crop = imadjust(crop, [0.3 0.75], []);
    crop = imfilter(crop, H1);
    sharp_crop = (crop);
    %sharp_crop = imadjust(sharp_crop, [0.2, 0.6], []);
    subplot(2,2,1)
    imshow(image)
    subplot(2,2,2)
    imshow(sharp_crop);
    subplot(2,2,4)
    imhist(sharp_crop);
    subplot(2,2,3)
    [histVal, pixVal] = imhist(sharp_crop);
    avg2(i-179) = sum(histVal.*pixVal)/sum(histVal);
    i
    plot(avg2)
%     pause;
end 
%%
for i = 350:length(files)
    figure(3)
    image = I.image{i};
    crop1 = imcrop(image, [(RE(i,:) - [13,7]) 22 13]);
    crop2 = imcrop(image, [(LE(i,:) - [11,7]) 22 13]);
    crop = [1.2*crop1(:,:,2) zeros(14, 5) 0.9*crop2(:,:,2)];
    crop = imadjust(crop, [0.3 0.75], []);
    crop = imfilter(crop, H1);
    sharp_crop = (crop);
    %sharp_crop = imadjust(sharp_crop, [0.2, 0.6], []);
    subplot(2,2,1)
    imshow(image)
    subplot(2,2,2)
    imshow(sharp_crop);
    subplot(2,2,4)
    imhist(sharp_crop);
    subplot(2,2,3)
    [histVal, pixVal] = imhist(sharp_crop);
    avg3(i-349) = sum(histVal.*pixVal)/sum(histVal);
    i
    plot(avg3)
%     pause;
end 