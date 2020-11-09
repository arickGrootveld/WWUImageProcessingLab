saveImagePath = 'Images/HardDataset/image';

imageExtension = '.png';

[~,~,~,numImages] = size(relatedFrames);

m = 0;
for i = 1:numImages
    if(i > 5 && i < 24)
        m = m + 1;
        targFrame = uint8(relatedFrames(:,:,:,i));
        imwrite(targFrame, strcat(saveImagePath, num2str(m), imageExtension));
    end
    
    
end
