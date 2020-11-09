function score = IOUAlgorithm(labX, labY, labH, labV, propX, propY, propH, propV, templateImage)
    
    %% Getting dimensions
    [dim1, dim2] = size(templateImage);
    
    % Computing dimensions of labelled image
    labWidth = dim1 * labH;
    labHeight = dim2 * labV;
    
    % Computing dimensions of proposed image
    propWidth = dim1 * propH;
    propHeight = dim2 * propV;
    
    
    %% Compute intersection and union areas of the two rectangles
    
    % Formatting the rectangle dimensions to be what rectint accepts
    % i.e. (x, y, w, h)
    labRectDims = [labX, labY, labWidth, labHeight];
    propRectDims = [propX, propY, propWidth, propHeight];
    
    labArea = labWidth * labHeight;
    propArea = propWidth * propHeight;
    
    intArea = rectint(labRectDims, propRectDims);
    
    % Union area is the sum of areas minus the area that they intersect
    unArea = labArea + propArea - intArea;
    
    score = intArea / unArea;
end



