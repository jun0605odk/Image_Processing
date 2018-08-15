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
title('収縮')

figure(3)
I = imdilate(Img,SE);
imshow(I)
title('膨張')

figure(4)
I = imtophat(Img,SE);
imshow(I)
title('ホワイトトップハット')

figure(5)
I = imbothat(Img,SE);
imshow(I)
title('ブラックトップハット')

