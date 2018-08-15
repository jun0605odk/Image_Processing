name = '../image/LENNA.bmp';
Org = imread(name);

%RGB
figure (1)
subplot(2,2,1);
imshow(Org);
title('Org')

mapR = [(0:255)/255; zeros(1,256); zeros(1,256)]';
mapG = [zeros(1,256); (0:255)/255; zeros(1,256)]';
mapB = [zeros(1,256); zeros(1,256); (0:255)/255]';

subplot(2,2,2);
imshow(Org(:,:,1),mapR)
title('R')

subplot(2,2,3);
imshow(Org(:,:,2),mapG)
title('G')

subplot(2,2,4);
imshow(Org(:,:,3),mapB)
title('B')


%îíçï
figure (2)

subplot(2,2,1);
Y1 = uint8((222*Org(:,:,1) + 707*Org(:,:,2) + 71*Org(:,:,3)) / 1000);
imshow(Y1)
title('ITU')

subplot(2,2,2);
Y2 = 0.2988*Org(:,:,1) + 0.5870*Org(:,:,2) + 0.1140*Org(:,:,3);
imshow(Y2)
title('NTSC')

subplot(2,2,3);
Y3 = (Org(:,:,1) + Org(:,:,2) + Org(:,:,3)) / 3;
imshow(Y3)
title('simple')

subplot(2,2,4);
Y4 = rgb2gray(Org);
imshow(Y4)
title('matlab comand')

%å∏êF
figure (4)
%ÇPÇUÊ~í≤
subplot(2,2,1);
Y16 = fix(Y2./16).*16 + 16;
imshow(Y16)
title('Y16')
%ÇWÊ~í≤
subplot(2,2,2);
Y8 = fix(Y2./32).*32 + 32;
imshow(Y8)
title('Y8')

%ÉKÉìÉ}ï‚ê≥
figure (5)

subplot(2,2,1);
% G = (aF +b)^ganma         F is Original Image
g1 = (3.*Org + 0).^1;
imshow(g1)
title('g1')

subplot(2,2,2);
g2 = Y2-50;
imshow(g2)
title('g2')

subplot(2,2,3);
Yave = mean(mean(Y1));
g3 = uint8(((double(Y2)./Yave).^2).*Yave);
imshow(g3)
title('g3')


%ÉqÉXÉgÉOÉâÉÄ
figure(6)
subplot(2,3,4);
imhist(Org(:,:,1),mapR);
title('R')

subplot(2,3,5);
imhist(Org(:,:,2))
title('G')

subplot(2,3,6);
imhist(Org(:,:,3))
title('B')