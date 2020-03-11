function DDD(I, Eyes, thresh)
    f = uifigure;
    thresh_vect = thresh*ones(size(I));
    avg = zeros(size(I));
    for i=1:length(Eyes)
        figure(1)
        image = I{i};
        subplot(2,2,1)
        imshow(image)
        subplot(2,2,2)
        if (size(Eyes{i},3 )> 1)
            eyes = Eyes{i}(:,:,2);
        else
            eyes = Eyes{i};
        end
        eyes = imadjust(eyes,stretchlim(eyes, [0.005 .99]),[]);
        imshow(eyes)
        subplot(2,2,4)
        imhist(eyes);
        subplot(2,2,3)
        [histVal, pixVal] = imhist(eyes);
        avg(i) = sum(histVal.*pixVal)/sum(histVal);
        if(i > 3)
            if (avg(i) > thresh)
                if ((avg(i-2)>thresh) && (avg(i-1) > thresh))
                    if (~(ishandle(f)))
                        f = uifigure;
                        uialert(f,'PULL OVER and GET SLEEP','Invalid File');
                        pause;
                    end
                end
            else
                if(ishandle(f))
                    delete(f)
                end
            end
        end
        
        plot(avg(1:i))
        hold on
        plot(thresh_vect(1:i))
        hold off
        
    end
    pause;
end