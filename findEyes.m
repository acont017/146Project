function eyes = findEyes(Images, LE, RE)
    for i = 1:length(Images)
        I=Images{i};
        rightEye = imcrop(I, [(RE(i,:) - [13,7]) 22 13]);
        leftEye = imcrop(I, [(LE(i,:) - [11,7]) 22 13]);
        eyes{i} = [rightEye leftEye];
    end
end
