image = imread("t.png");
image_2 = imread("t.png");
image_3 = imread("t.png");
[rows,column]=size(image);
SE=[[0 1 0]
    [1 0 0]
    [1 1 0]]; % define the structuring element.
[rows_el, column_el]=size(SE);
SE_2 = strel(SE);

elem = SE_2.Neighborhood; % element neighborhood as logical array

origin_ind = 1;%idivide(width,int32(2)); % origin 

max_h=rows-mod(rows,rows_el)-rows_el+2;
max_l=column-mod(column,column_el)-column_el+2;

dilate_image=false(size(image)); % black image to perform dilation

for i=1:max_h
    for j=1:max_l
        or=image_2(i+origin_ind,j+origin_ind); % origin extraction
        if or
            ch=dilate_image(i:i+rows_el-1,j:j+column_el-1);
            ch(elem)=1; 
            dilate_image(i:i+rows_el-1,j:j+column_el-1)=ch; % наложение маски со структурного элемента
        end
    end
end

matlab_dilate_image=imdilate(image_3,SE_2); % apply the dilation operation.

% comparison of 2 dilated images
result = 1;
for i=1:rows
    for j=1:column
        if dilate_image(i, j) ~= matlab_dilate_image(i, j)
            result = 0;
            %disp([i, j]);
        end
    end
end
disp([result]);

% show images
imshow(mat2gray(dilate_image));
figure;
imshow(mat2gray(matlab_dilate_image));

%disp(dilate_image)