%% Distracted Driver Detection

load('test.mat')

for i = 1:length(files)
    figure(1)
    image = I.image{i};
%     image = insertShape(image,'rectangle',[(LE(i,:) - [8,6]) 20 14], 'Color', 'green');
%     image = insertShape(image,'rectangle',[(RE(i,:) - [10,6]) 20 14], 'Color', 'green');
    crop1 = imcrop(image, [(RE(i,:) - [8,6]) 20 14]);
    crop2 = imcrop(image, [(LE(i,:) - [10,6]) 20 14]);
%     imshow(image)
%     pause;
    crop = [crop1 crop2];
    crop = crop(:,:,2);
    subplot(1,2,1)
    imshow(crop)
    subplot(1,2,2)
    imshow(crop>160)
    pause;
end 