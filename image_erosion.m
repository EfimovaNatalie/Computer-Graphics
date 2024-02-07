image = imread("t.png");
[rows,column]=size(image);
width = int32(3); % width of square for dilation and erode
d_ind = idivide(width,int32(2));
SE=[[0 1 0]
    [1 0 0]
    [1 1 0]]; % define the structuring element.
[rows_el, column_el]=size(SE);
num_of_white = 0;
for i=1:rows_el
    for j=1:column_el
        if SE(i, j) == double(1)
            num_of_white = num_of_white + 1;
        end
    end
end

erode_image = image; % copy of original image to be eroded
for i=1:rows
    for j=1:column
        count = int32(0);
        for k = -d_ind:d_ind
            for l = -d_ind:d_ind
                if (i+k >= 1) && (j+l >= 1) && (i+k <= rows) && (j+l <= column)
                    if (image(i+k, j+l) == 1) && (SE(1+d_ind+k, 1+d_ind+l) == 1)
                        count = int32(count) + int32(1);
                    end
                else
                    erode_image(i, j) = double(image(i, j));
                end
            end
        end
        %disp([int32(count), i, j]);
        if ((count) == num_of_white)
            %disp([(count), int32(count), i, j])
            erode_image(i, j) = double(1);
        else
            erode_image(i, j) = double(0);
        end
    end
end

matlab_erode_image=imerode(image,SE); % apply the dilation operation.

% comparison of 2 eroded images
result = 1;
for i=1:rows
    for j=1:column
        if erode_image(i, j) ~= matlab_erode_image(i, j)
            result = 0;
            disp([i, j]);
        end
    end
end
disp([result]);

% show erode images
imshow(mat2gray(image));
figure;
imshow(mat2gray(matlab_erode_image));
figure;
imshow(mat2gray(erode_image));
imwrite(mat2gray(erode_image),"erode_image.jpg")
%disp(erode_image);