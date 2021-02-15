%% This is the main file of EE433 Lab Z. 
% This script provides a wrapper for students object detection and tracking
% algorithms. When the script is run, it will allow the user to select from 2
% different datasets, and then will run the students algorithm passing it
% the template and image to detect an object in. The output of the students
% algorithm must be the x and y coordinates of the suspected object, the
% horizontal and vertical scaling of the template to match over the object.
%
% From the output of the students script, the students performance on an
% image by image basis will be scored, and a final score will be generated
% from the average performance.
% 
% In order for this script to operate it requires that there a file called 
% objectDetectionAlgorithm.m present in the current directory where this 
% is run.


%% Dataset Selection
dataset = 'easy';                   % Variable to set the dataset to target. Can be "easy", "medium", or "hard"



%% Loading datasets

% Using easy dataset
if(strcmpi(dataset, 'easy'))
    % Selecting dataset
    targFiles = dir('datasets/easy/*.png');
    % Grabbing labels
    load('datasets/labels/easyLabels.mat', 'labelStruct');
    % Selecting template
    template = imread('datasets/templates/easyTemplate.png');
    
% Using medium dataset
elseif(strcmpi(dataset, 'medium'))
    % Selecting dataset
    targFiles = dir('datasets/medium/*.png');
    % Grabbing labels
    load('datasets/labels/mediumLabels.mat', 'labelStruct');
    % Selecting template
    template = imread('datasets/templates/mediumTemplate.png');

% Using hard dataset
elseif(strcmpi(dataset, 'hard'))
    % Selecting dataset
    targFiles = dir('datasets/hard/*.png');
    % Grabbing labels
    load('datasets/labels/hardLabels.mat', 'labelStruct');
    % Selecting template
    template = imread('datasets/templates/hardTemplate.png');
    
% Dataset selected was not one of the valid possibilities. Specify to the 
% user to provide a valid dataset string
else
    error('This is not a valid dataset, please set it to one of "easy", "medium", or "hard"');
end

% Preallocating the results struct
results = struct('targImage', cell(size(targFiles,1),1), 'score', cell(size(targFiles,1),1));

%% Running the algorithm and recording result for every image in the dataset

for i = 1:size(targFiles, 1)
    % Loading the image to be input to students algorithm
    targetImage = imread(strcat(targFiles(1).folder, '/image', num2str(i), '.png'));
    % Calling students algorithm, and taking output for evaluation
    [propXCoord, propYCoord, propHScale, propVScale]= objectDetectionAlgorithm(targetImage, template);
    
    % Find the index of the correct labels from the image supplied
    labelInd = find(strcmp({labelStruct.filename}, strcat('image', num2str(i), '.png')));
    % Loading the labelled X, and Y coordinates, and horizonatal and
    % vertical scales.
    labelXCoord = labelStruct(labelInd).xCoord;
    labelYCoord = labelStruct(labelInd).yCoord;
    labelHScale = labelStruct(labelInd).hScale;
    labelVScale = labelStruct(labelInd).vScale;
    
    % Storing the scores of the students algorithm on each of the images
    results(i).targImage = strcat('image', num2str(i), '.png');
    
    % Calling the IOU function to evaluate students results using an
    % Intersection Over Union scoring scheme
    results(i).score = IOUAlgorithm(labelXCoord, labelYCoord, labelHScale, labelVScale, propXCoord, propYCoord, propHScale, propVScale, template);

    
end

% Showing the students average performance
meanScore = mean([results.score])

% Clearing out most variables to keep the amount of information the student has to deal with to a minimum
clearvars -except results template dataset

