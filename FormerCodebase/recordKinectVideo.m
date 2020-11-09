close all;

info = imaqhwinfo('kinect');

vid = videoinput('kinect',1);

src = getselectedsource(vid);

% preview(vid);
disp('Press a button to start recording');
pause();

start(vid);

numImages = 10;
imageMatrix = zeros(numImages, 1080, 1920, 3);
imageFileName = 'Images/mediumDataset/image';
imageExtension = '.png';



% for i = 1:numImages
% %    imageMatrix(i, :, :, :) = getsnapshot(vid);
% %    image = getsnapshot(vid);
%    imwrite(image, strcat(imageFileName, num2str(i), imageExtension));
%    
% end

% for p = 1:numImages
%     
% %     disp('Press a button to display the next image');
% %     pause();
%     imshow(squeeze(imageMatrix(p, :, :,:)));
% end

% [frame, ts, metaData] = getdata(vid);
% 
% [~, ~, ~, numImages] = size(frame);
% 
% for i = 1:numImages
%    imshow(frame(:,:,:,i));
%    pause();
%     
% end

stop(vid);
