% Kyle Osbourne / Alex Rizzo
% Photo Editing Program
% IMPORTANT: This program requires the Image Processing Toolbox to
% properly function.
% This first menu is used to ask the user if they want to access the
% program, or exit.
menu = input("Welcome to the Photo Editor, upload an image to access the menu.\n" + ...
    "1. Upload Image\n" + ...
    "2. Quit Program\n");
disp("Notice: Please change file format to 'All Files' when selecting image.")
if menu < 0 || menu > 2
        disp("Error, the number must be either 1 or 2.")
    else
        switch menu
            case {1}
                % These lines of codes open up a prompt where the user can
                % select the desired photo, the user is actually selecting
                % a directory, that gets converted to display an image.
                [filename, directory] = uigetfile();
                originalImage = fullfile(directory, filename);
                userImage = imread(originalImage);
                % A while loop is declared to keep the menu open for the
                % user, multiple options are displayed.
                userprogress = true;
                while userprogress
                disp("--- Photo Editing Menu ---");
                disp("What would you like to do?");
                choice = input("1. Invert Image\n" + ...
                    "2. Magnify Image\n" + ...
                    "3. Convert to Grayscale (Only for RGB images)\n" + ...
                    "4. Rotate Image 15° Clockwise \n" + ...
                    "5. Display Current Image\n" + ...
                    "6. Display Original Image\n" + ...
                    "7. Reset Image to Default\n" + ...
                    "8. Enhance Lighting (For low light images)\n" + ...
                    "9. Dither Image (Only for Grayscale Images)\n" + ...
                    "10. Display before | After Comparison\n" + ...
                    "11. Export Image\n" + ...
                    "12. Exit Program without Saving\n");
                switch choice
                    case {1}
                        % The incomplement function inverts the image for
                        % the user.
                         userImage = imcomplement(userImage);
                         disp("Image successfully inverted.")
                    case {2}
                        % The imresize function "magnifies" the image, the
                        % multipler is fixed to avoid complications.
                        userImage = imresize(userImage,0.5);
                        disp("Image magnified.")
                    case {3}
                        % The rgb2gray function, as specified in the name,
                        % converts an RGB image to a grayscale format.
                        userImage = rgb2gray(userImage);
                        disp("Image converted to grayscale.")
                    case {4}
                        % imrotate rotates the image, the degree of
                        % rotation is fixed to avoid hassle, and the
                        % rotation style "loose" is locked due to a loose
                        % rotation style preventing cropping.
                        userImage = imrotate(userImage,15,'bilinear','loose');
                    case {5}
                        % imshow displays an image to the user, this is
                        % being used to display the "current" image.
                        imshow(userImage);
                    case {6}
                        % imshow displays an image to the user, this is
                        % being used to display the "original" image.
                        imshow(originalImage);
                    case {7}
                        % This is simply changing the userImage variable
                        % contents to that of the original image, basically
                        % resetting it to default.
                        userImage = originalImage;
                        disp("Image reset to default!")
                    case {8}
                        % The image is inverted, a dehazing algorithm is
                        % used, then the image is inverted yet again, this
                        % is to enhance lighting in dark images.
                        userImage = imcomplement(userImage);
                        userImage = imreducehaze(userImage);
                        userImage = imcomplement(userImage);
                    case {9}
                        % The dither function adds more noise to a
                        % grayscale formatted image.
                        userImage = dither(userImage);
                    case {10}
                        % A process of functions is executed here, a tiled
                        % layout for 2 images is created, with two images
                        % being displayed.
                        % The caption, "Before" and "After" are displayed
                        % on their respective images.
                        tiledlayout(1,2);
                        nexttile;
                        imshow(originalImage);
                        title('Before');
                        nexttile;
                        imshow(userImage);
                        title('After');
                    case {11}
                        % The completed image is exported with the filename
                        % "userImage"
                        imwrite(userImage,"userImage.jpeg")
                        disp("Image Exported!")
                    case {12}
                        % The while
                        disp("Program Terminated.")
                        userprogress = false;
                    otherwise
                        % This switch statement is used to catch invalid
                        % inputs, if this occurs, this message will
                        % display, and the menu will re-appear.
                        disp("This option is invalid.")
                end
                end
            case {2}
                % If the user opts to not upload and instead, quit the
                % program, the program terminates.
                return
        end
end
