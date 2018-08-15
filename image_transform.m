name = '../image/LENNA_mono.bmp';
Img = imread(name);
[sizex, sizey] = size(Img);
%makeform = []

%‚¹‚ñ’f
tform = maketform('affine',[1 0 0;0.5 1 0;0 0 1]);
Img_t = imtransform(Img,tform);

%‰ñ“]
tform = maketform('affine',[cos(pi/6) sin(pi/6) 0;-sin(pi/6) cos(pi/6) 0;0 0 1]);
Img_t2 = imtransform(Img,tform);


figure(1)
subplot(2,2,1);
imshow(Img_t);
subplot(2,2,2);
imshow(Img_t2);
subplot(2,2,3);
imshow(Img);



scal = 4;
colormap(gray)
Img4 = Img(1:scal:end,1:scal:end);

figure(2)
subplot(2,2,1);
%imshow(Img4);
imagesc(Img4);
title('Img4')
axis([0 sizex 0 sizey])

subplot(2,2,3);
imagesc(imresize(Img4,scal,'nearest'));
title('Img4 * 4bi scale (nearest)')

subplot(2,2,4)
imagesc(imresize(Img4,scal,'bilinear'));
title('Img4 * 4bi scale (bilinear)')

figure(3)
subplot(2,1,1)
imagesc(imrotate(Img,30,'nearest','crop'));
title('Img rotate (nearest)')
subplot(2,1,2)
imagesc(imrotate(Img,30,'bilinear','crop'));
title('Img rotate (bilinear)')



% figure(4)
% imagesc(imnoise(Img));