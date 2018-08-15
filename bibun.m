name = '../image/LENNA_mono.bmp';
Img = imread(name);
[sizex, sizey] = size(Img);


TImg1 = imnoise(Img,'gaussian',0.2,0.01);
TImg2 = imnoise(Img,'salt & pepper',0.1);

figure(1)
subplot(2,2,1);
imshow(TImg1);
subplot(2,2,2);
imshow(TImg2);
subplot(2,2,3);
imshow(Img);

w1 = ones(3,3)./9;
w2 = ones(7,7)./49;
Img_w1 = filter2(w1,TImg2);
Img_w2 = filter2(w2,TImg2);

figure(2)
subplot(2,2,1);
imshow(uint8(Img_w1))
subplot(2,2,2);
imshow(uint8(Img_w2))
subplot(2,2,3);
imshow(Img);


Img_w1 = filter2(w1,TImg1);
Img_w2 = filter2(w2,TImg1);

figure(3)
subplot(2,2,1);
imshow(uint8(Img_w1))
subplot(2,2,2);
imshow(uint8(Img_w2))
subplot(2,2,3);
imshow(Img);


Img_med = medfilt2(TImg2,[3 3]);

figure(4)
subplot(2,2,1);
imshow(uint8(Img_med))
subplot(2,2,2);
imshow(uint8(TImg2))
subplot(2,2,3);
imshow(Img);


Img_med = medfilt2(TImg1,[3 3]);

figure(5)
subplot(2,2,1);
imshow(uint8(Img_med))
subplot(2,2,2);
imshow(uint8(TImg2))
subplot(2,2,3);
imshow(Img);


w1 = [-1 0 1;...
      -1 0 1;...
      -1 0 1];
  
w2 = [-1 0 1;...
      -2 0 2;...
      -1 0 1];
  
w3 = [0  0 0;...
      1 -2 1;...
      0  0 0];

Img_w11 = filter2(w1,Img);
Img_w21 = filter2(w2,Img);
Img_w31 = filter2(w3,Img);
Img_w12 = filter2(w1',Img);
Img_w22 = filter2(w2',Img);
Img_w32 = filter2(w3',Img);

figure(6)
subplot(2,3,1);
imshow(uint8(Img_w11))
subplot(2,3,2);
imshow(uint8(Img_w21))
subplot(2,3,3);
imshow(uint8(Img_w31))
subplot(2,3,4);
imshow(uint8(Img_w12))
subplot(2,3,5);
imshow(uint8(Img_w22))
subplot(2,3,6);
imshow(uint8(Img_w32))