clear;
num = 1:10:601;
for i = 1:61
    picName(i) = {sprintf('data%05d',num(i))};
end
for i = 1:length(picName)
    Images.test.picture{i} = imrotate(imread([picName{i} '.jpg']),-90);
%     EyeDetect = vision.CascadeObjectDetector('EyePairBig');
%     I = Images.test.picture{i};
%     BB=step(EyeDetectI);
%     Images.test.eyes{i} = imcrop(I,BB);
end
EyeDetect = vision.CascadeObjectDetector('EyePairBig');
I = Images.test.picture{1};
BB=step(EyeDetect,I);
for i = 1:length(picName)
    I = Images.test.picture{i};
    Images.test.leftEye{i} = rgb2gray(imcrop(I,BB - [0 0 548-238 0]));
    Images.test.rightEye{i} = rgb2gray(imcrop(I,BB + [350 0 -350 0]));
    Images.test.eyes{i} = [Images.test.rightEye{i} Images.test.leftEye{i}];
end
for i = 1:length(Images.person1)4.
%%
clear avg;
for i = 1:61
    figure(1)
    image = Images.test.picture{i};
    subplot(2,2,1)
    imshow(image)
    subplot(2,2,2)
    eyes = imadjust(Images.test.eyes{i},stretchlim(Images.test.eyes{i}, [0.005 .99]),[]);
%     eyes = im2bw(eyes);
    imshow(eyes);
    subplot(2,2,4)
    imhist(eyes);
    subplot(2,2,3)
    [histVal, pixVal] = imhist(eyes);
    avg(i) = sum(histVal.*pixVal)/sum(histVal);
    i
    plot(avg)
    pause;
end 
