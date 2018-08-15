clear all;
close all;

% 画像読み込み
template = imread('../Image/ウォーリー.png');
background = imread('../Image/org.jpeg');

% グレースケール化
tempg = rgb2gray(template);
backg = rgb2gray(background);

% 画像サイズ取得
[by, bx] = size(backg);
[ty, tx] = size(tempg);

% 時間計測開始
tic

% フーリエ変換
Ga = fft2(backg);
Gb = fft2(tempg, by, bx);

% 合成および逆フーリエ変換
c = real(ifft2((Ga.*conj(Gb))./abs(Ga.*conj(Gb))));

% マッチングしている個所を特定する
[max_c, imax] = max(abs(c(:)));
[ypeak, xpeak] = find(c == max(c(:)));

% 時間計終了
toc

% 画像の表示
fFig = figure;
hAx =axes;
position = [xpeak(1), ypeak(1),tx,ty];
imshow(background, 'parent', hAx);
imrect(hAx, position);
