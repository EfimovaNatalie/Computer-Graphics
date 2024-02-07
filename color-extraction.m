imfinfo('c.tif')
c=imread('c.tif');
p=[230,123,9]; % peach color
% red
cr=c(:,:,1); % extraction of red color
cg=c(:,:,2); % extraction of green color
cb=c(:,:,3); % extraction of blue color
cr(cr>150 & cg<50 & cb<60)=p(1);
cg(cr>150 & cg<50 & cb<60)=p(2); 
cb(cr>150 & cg<50 & cb<60)=p(3);
c_r(:,:,1)=cr;
c_r(:,:,2)=cg;
c_r(:,:,3)=cb;
imwrite(c_r,"c_r.jpg")
% red and yellow and orange
cr=c(:,:,1);
cg=c(:,:,2);
cb=c(:,:,3);
cr(cr>150 & 100<cg<150 & cb<100)=p(1);
cg(cr>150 & 100<cg<150 & cb<100)=p(2); 
cb(cr>150 & 100<cg<150 & cb<100)=p(3);
c_ryo(:,:,1)=cr;
c_ryo(:,:,2)=cg;
c_ryo(:,:,3)=cb;
imwrite(c_ryo,"c_ryo.jpg")
% red and orange
cr=c(:,:,1);
cg=c(:,:,2);
cb=c(:,:,3);
cr(cr>150 & cg<100 & cb<100)=p(1); 
cg(cr>150 & cg<100 & cb<100)=p(2); 
cb(cr>150 & cg<100 & cb<100)=p(3);
c_ro(:,:,1)=cr;
c_ro(:,:,2)=cg;
c_ro(:,:,3)=cb;
imwrite(c_ro,"c_ro.jpg")

% orange
%idea: ro - r
cr=c(:,:,1);
cg=c(:,:,2);
cb=c(:,:,3);
cr(cr>150 &  cg<100 & cb<100 & ~(cr>150 & cg<60 & cb<60))=p(1); 
cg(cr>150 &  cg<100 & cb<100 & ~(cr>150 & cg<60 & cb<60))=p(2);  
cb(cr>150 &  cg<100 & cb<100 & ~(cr>150 & cg<60 & cb<60))=p(3);
c_o(:,:,1)=cr;
c_o(:,:,2)=cg;
c_o(:,:,3)=cb;
imwrite(c_o,"c_o.jpg")

%green
cr=c(:,:,1);
cg=c(:,:,2);
cb=c(:,:,3);
cr(cr<100 & cg>100 & cb<100)=p(1);
cg(cr<100 & cg>100 & cb<100)=p(2); 
cb(cr<100 & cg>100 & cb<100)=p(3);
c_g(:,:,1)=cr;
c_g(:,:,2)=cg;
c_g(:,:,3)=cb;
imwrite(c_g,"c_g.jpg")
%purple
cr=c(:,:,1);
cg=c(:,:,2);
cb=c(:,:,3);
cr(cr>60 & cg<100 & cb>100)=p(1);
cg(cr>60 & cg<100 & cb>100)=p(2); %<100 <100 >100
cb(cr>60 & cg<100 & cb>100)=p(3);
c_p(:,:,1)=cr;
c_p(:,:,2)=cg;
c_p(:,:,3)=cb;
imwrite(c_p,"c_p.jpg")
%blue
cr=c(:,:,1);
cg=c(:,:,2);
cb=c(:,:,3);
cr(cr<100 & cg>60 & cb>100)=p(1);
cg(cr<100 & cg>60 & cb>100)=p(2); 
cb(cr<100 & cg>60 & cb>100)=p(3);
c_b(:,:,1)=cr;
c_b(:,:,2)=cg;
c_b(:,:,3)=cb;
imwrite(c_b,"c_b.jpg")
%yellow
cr=c(:,:,1);
cg=c(:,:,2);
cb=c(:,:,3);
cr(cr>150 & cg>150 & cb<100)=p(1); 
cg(cr>150 & cg>150 & cb<100)=p(2); 
cb(cr>150 & cg>150 & cb<100)=p(3);
c_y(:,:,1)=cr;
c_y(:,:,2)=cg;
c_y(:,:,3)=cb;
imwrite(c_y,"c_y.jpg")

fig=figure("Name","color_extraction_1");
subplot(3,2,1);
imshow(c);
axis image
title('original')
subplot(3,2,2)
imshow(c_r);
title('red')
subplot(3,2,3)
imshow(c_g);
title('green')
subplot(3,2,4)
imshow(c_p);
title('purple')
subplot(3,2,5)
imshow(c_b);
title('blue')
subplot(3,2,6)
imshow(c_y);
title('yellow')

fig=figure("Name","color_extraction_2");
subplot(2,1,1);
imshow(c);
axis image
title('original')
subplot(2,1,2)
imshow(c_o);
title('orange')
