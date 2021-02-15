% objectDetectionAlgorithm(targImage, template)
%% Student written function to find the object in the target image
% Will take as input the image to find the object in, and a template image
% of the object to find. Will output the X Coordinate of the suspected
% object, the Y Coordinate of the supected object, the horizonatal scale of
% the template image to match the object, and the vertical scale of the
% template to match the object. 

% The code contained in this file is just an outline of what should be
% contained in this file. Fill in the rest of the content with your own
% algorithm. As of right now there is example code that will give you a
% rough idea of what your supposed to be doing, however this code is NOT
% fully functional, and turning in exactly this code will most likely
% result in poor performance on the object detection.

function [xCoord, yCoord, hScale, vScale] = objectDetectionAlgorithm(targImage, template)
    
    % Example code, replace with your own code here
    xCoord = 22;
    yCoord = 231;
    hScale = 1;
    vScale = 1;
    
    addpath('utilities');
    displayTransparentMixedImage(template, targImage, xCoord, yCoord, hScale, vScale);
    disp('press any key to continue');
    pause;
end