% This script allows the user to loop through all possible images
% from the dataset directory, and then specify which template image
% they want to use on the dataset.
% Then the code will allow the user to loop through each image
% and position the template where they think it would be best as a label,
% and once a suitable location is found for the template it will spit out
% the center coordinate of the template, and the reshape factor

close all;
clear;

%% Loading the dataset and template directories
datasetList = dir('dataset');
datasetList = datasetList(~startsWith({datasetList.name}, '.'));

templateList = dir('templates');
templateList = templateList(~startsWith({templateList.name}, '.'));

%% Loop through possible template images and define which one to use
templateOptions = strings(length(templateList), 1);
disp("These are your options for template images: ");

for m = 1:length(templateList)
    templateOptions(m) = templateList(m).name;
    disp(strcat("Option ", num2str(m), ": ", templateOptions(m)));
end

disp("Enter the number for the option you'd like to select into the terminal");

% User should type the number associated with the template they want
noInput = 1;

while noInput > 0
    templateNum = input("");
    % If input is an integer that fits in the range of possible template
    % options then let it through
    if (floor(templateNum) == templateNum) && (templateNum <= length(templateList))
       disp(strcat("'", templateOptions(templateNum), "' is the template image selected"));
       noInput = -1;
    
    % Else we tell them to try again until a correct value is selected
    else
        disp(strcat(num2str(templateNum), " is not a correct value, please try again"));
    end
end

%% Loading the template image selected and showing it to the user
templateImageFilename = strcat(templateList(templateNum).folder, '/', templateList(templateNum).name);

templateImage = imread(templateImageFilename);

% Displaying the template image selected
fig1 = figure(1); ax1 = axes(fig1);
imshow(templateImage);
title(ax1, 'Template Image Selected');

%% Loading images from the dataset
for m = 1:length(datasetList)
    targetImageFilename = strcat(datasetList(m).folder, '/', datasetList(m).name);
    targetImage = imread(targetImageFilename);
    
    % Showing the current dataset image
    fig2 = figure(2); % ax2 = axes(fig2);
    disp2 = imshow(targetImage);
%     title(ax2, 'Current Dataset Image');
    
    % Taking user input and showing the template image overlayed on
    % the dataset image until the user is satisfied
    satisfied = 0;
    while satisfied < 1
        % Asking the user for the center point that the template should assume
        % over the dataset image
        disp("Enter the X coordinate where the template image should be centered");
        templateXCoord = input("");
        disp("Enter the Y coordinate where the template image should be centered");
        templateYCoord = input("");
        
        
        % Asking the user for the scale that the template image should be
        % multiplied by in order to properly fit the dataset image
        disp("Enter the scale factor for the template image in the horizontal direction");
        templateScaleHorizontal = input("");
        
        disp("Enter the scale factor for the template image in the vertical direction");
        templateScaleVertical = input("");
        
        % Making sure that the provided inputs are valid numbers
        bool1 = floor(templateXCoord) == templateXCoord;
        bool2 = floor(templateYCoord) == templateYCoord;
        
        % TODO: Add additional error handling and catching for the usage of
        % these inputs
        
        % If the inputs are not valid then tell the user that and have them
        % try again
        if ~(bool1 && bool2)
           disp("The X and Y coordinates are not valid for the template image"); 
        
        else
           % Display the template image overlayed ontop of the dataset
           % image, scaled by input factor
           
           %%% TODO: Make this part show the template image overlayed
           %%% TODO: over the target image
           
           % Resizing template image to be scaled copy
           [dim1, dim2] = size(templateImage);     
           tempCopy = imresize(templateImage, [floor(templateScaleHorizontal*dim1), floor(templateScaleVertical*dim2)]);
            
           % "Overlaying" the template image over the target image
           test = rgb2gray(targetImage);
           test((1:size(tempCopy,1))+templateXCoord,(1:size(tempCopy,2))+templateYCoord,:) = tempCopy;
           imshow(test);
           
           % Check to see if the user is satisfied with the location of
           % the template image
           disp("Is this a suitable label for the template image?");
           disp("Type in 0 if it is not, and 1 if it is");
           satisfied = input("");
           
           % If they are satisfied then spit out everything required for
           % IOU algorithm
           if(satisfied >= 1)
              % TODO: Once format required for IOU algorithm
              % TODO: is determined, update this part
              disp(strcat("The X coordinate is: ", num2str(templateXCoord)));
              disp(strcat("The Y coordinate is: ", num2str(templateYCoord)));
              disp(strcat("The H scale is: ", num2str(templateScaleHorizontal)));
              disp(strcat("The V scale is: ", num2str(templateScaleVertical)));

           end
        end
        
        
    end
    
    
    
end

disp("Thats all images in this dataset, your free for now");


