clear all;
close all;

% 画像読み込み
I1 = imread('../Image/LENNA.bmp');
I2 = imread('../Image/ぬいぐるみ.jpg');

% trimming
I2 = imcrop(I2,[100 200 255 255]);

% グレースケール化
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);

% 画像サイズ取得
[by bx] = size(I1);
[ty tx] = size(I2);

% 高速フーリエ変換
Ga = fft2(I1);
Gb = fft2(I2);

% それぞれの大きさと位相を求める
Ga_ang = angle(Ga);
Ga_mag = abs(Ga);
Gb_ang = angle(Gb);
Gb_mag = abs(Gb);

% 位相を入れ替える
Ga2 = Ga_mag.*exp(j*Gb_ang);
Gb2 = Gb_mag.*exp(j*Ga_ang);

% 逆フーリエ高速変換
I1_res = ifft2(Ga2);
I2_res = ifft2(Gb2);

% 元画像の表示
figure(1)
subplot(1,2,1)
imshow(I1);title('LENNA 処理前')
subplot(1,2,2)
imshow(I2);title('ぬいぐるみ 処理前')

% 変換後の画像の表示
figure(2)
subplot(1,2,1)
imshow(uint8(I1_res));title('LENNA 処理後')
subplot(1,2,2)
imshow(uint8(I2_res));title('ぬいぐるみ 処理後')

