close all;

vid = videoinput('kinect',1);

src = getselectedsource(vid);

imageDim = [flip(vid.VideoResolution), 3];
numImages = 1;

% Configuring the camera to trigger manually
vid.FramesPerTrigger = 10;
vid.TriggerRepeat = numImages;
triggerconfig(vid,'manual');

imageMatrixDim = [imageDim, numImages*vid.FramesPerTrigger];

imageMatrix = zeros(imageMatrixDim);

disp('Press a button to start recording');
pause();
start(vid);

for i = 0:numImages-1
   trigger(vid);
   imageMatrix(:,:,:,i*vid.FramesPerTrigger+1:(i+1)*vid.FramesPerTrigger) = getdata(vid);
end

stop(vid);