%% Distracted Driver Detection

load('test.mat')

% se1 = strel('disk', 2);
% se2 = strel('disk',3);
H1 = fspecial('average');
for i = 1:length(files)
    figure(1)
    image = I.image{i};
    crop1 = imcrop(image, [(RE(i,:) - [13,7]) 22 13]);
    crop2 = imcrop(image, [(LE(i,:) - [11,7]) 22 13]);
    crop = [1.2*crop1(:,:,2) zeros(14, 5) 0.9*crop2(:,:,2)];
    crop = imadjust(crop, [0.3 0.75], [],1.75);
    crop = imfilter(crop, H1);
%     subplot(1,2,1)
%     imshow(crop)
%     subplot(1,2,2)
    sharp_crop = imsharpen(crop);
    sharp_crop = imadjust(sharp_crop, [0.2, 0.6], []);
    imshow(sharp_crop);
    pause;
end 