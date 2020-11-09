[x, y, z, numImages] = size(imageMatrix);

curImage = zeros(x,y,z);
for m = 1:numImages
    curImage = imageMatrix(:,:,:,m);
    % Need to convert it to uint8 because the array is stored as a double
    imshow(uint8(curImage));
    disp(m);
    disp('show next image');
    pause();
end