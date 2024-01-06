% Photo Manipulation Code
% Using this script to create/edit photo editing code before it gets
% implemented in the final program.

% Convert to Grayscale
% Converts RGB picture to grayscale, if-statement to be used to prevent a
% grayscale picture from going through conversion.
userImage = rgb2gray(userImage);


% Invert Image 
% Inverts the image, reversing the colors of the picture.

 userImage = imcomplement(userImage);


% Magnify Image
% User will be able to choose a size they want to enlarge by, use
% if-statement to prevent them from inputting a value less than 1.
userImage = imresize(userImage,1.25);

% Crop Image (Not including)


% Enhance Lights
% One of the more ambitious tasks, uses the dehazing algorithm to execute.
userImage = imcomplement(userImage);
userImage = imreducehaze(userImage);
userImage = imcomplement(userImage);

% Rotate Image 15 Clockwise


% Dither Image
userImage = dither(userImage);

% Display Current Image
% Displays the current image the user has created.
imshow(currentImage);

% Display Original Image
% Displays the original image before the user's edits.
imshow(originalImage);

% Display Collage of Before | After Pictures
% Shows the user a collage, comparing the image before and after their
% edits.
% I want to make this a function
tiledlayout(1,2)
nexttile
imshow(originalImage)
title('Before')
nexttile
imshow(userImage)
title('After')

% Reset Image to Defaults
% Erases the user's edits, changing the image back to what it used to be.
userImage = originalImage;
disp("Image reset to default!")

% Import Image
% Allows the user to import a different image
[filename, directory] = uigetfile();
userImage = fullfile(directory, filename);
originalImage = userImage;
disp("New Image Imported.")

% Export Image
% This allows the user to export the image they've created
imwrite(userImage,"userImage.jpeg")
disp("Image Exported!")