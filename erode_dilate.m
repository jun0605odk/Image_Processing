Img = imread('../Image/pattern2.tif');
figure(1)
imshow(Img)

NHOOD = [0 1 0;1 1 1;0 1 0];  
NHOOD_w = [0 0 0;1 1 1;0 0 0];
NHOOD_h = [0 1 0;0 1 0;0 1 0];

SE = strel('arbitrary',NHOOD);
SE_w = strel('arbitrary',NHOOD_w);
SE_h = strel('arbitrary',NHOOD_h);

figure(2)
I = imerode(Img,SE);
imshow(I)
title('���k')

figure(3)
I = imdilate(Img,SE);
imshow(I)
title('�c��')

figure(4)
I = imtophat(Img,SE);
imshow(I)
title('�z���C�g�g�b�v�n�b�g')

figure(5)
I = imbothat(Img,SE);
imshow(I)
title('�u���b�N�g�b�v�n�b�g')

