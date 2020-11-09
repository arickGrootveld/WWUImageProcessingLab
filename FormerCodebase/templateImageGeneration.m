imshow(uint8(curImage));

fullImage = curImage;

fullImage(1:680,:,:) = 1;
fullImage(1080:-1:710,:,:) = 1;
fullImage(:,1:940,:) = 1;
fullImage(:,1920:-1:972,:) = 1;

pingPongBall = fullImage(680:710,940:972,:);

% Blacking out top left corner
pingPongBall(1:5,1:5,:) = 1;
pingPongBall(2,1:9,:) = 1;
pingPongBall(3,6:7,:) = 1;
pingPongBall(4,6,:) = 1;
pingPongBall(6,1:4,:) = 1;
pingPongBall(7,1:3,:) = 1;
pingPongBall(8,1:3,:) = 1;
pingPongBall(9,1:2,:) = 1;




% figure(1);
% imshow(uint8(fullImage));
figure(2);
imshow(uint8(pingPongBall));