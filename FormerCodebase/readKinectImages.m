imagePaths = dir('Images\mediumDataset\*.png');

for t = 1:length(imagePaths)
    disp('show the next image');
    pause();
    imagePath = strcat(imagePaths(t).folder, '\', imagePaths(t).name);
    image = imread(imagePath);
    imshow(image);
    
end