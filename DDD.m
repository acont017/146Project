%% Distracted Driver Detection

load('test.mat')

se = strel('disk', 2);
for i = 1:length(files)
    figure(1)
    image = I.image{i};
%     image = insertShape(image,'rectangle',[(LE(i,:) - [8,6]) 20 14], 'Color', 'green');
%     image = insertShape(image,'rectangle',[(RE(i,:) - [10,6]) 20 14], 'Color', 'green');
    crop1 = imcrop(image, [(RE(i,:) - [12,6]) 19 14]);
    crop2 = imcrop(image, [(LE(i,:) - [10,6]) 19 14]);
%     imshow(image)
%     pause;
    crop = [1.2*crop1 crop2];
    crop = crop(:,:,2);
    crop = imadjust(crop, [0.15 0.6], [],2);
    subplot(1,2,1)
    imshow(crop)
    subplot(1,2,2)
    binary = (crop>90) & (crop<150);
    binary = imclose(binary, se);
    binary = imopen(binary,se);
    imshow(binary)
    pause;
end 