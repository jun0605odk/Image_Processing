clear all;
close all;

% 画像読み込み
template = imread('../Image/ウォーリー.png');
background = imread('../Image/org.jpeg');

% グレースケール化
tempg = rgb2gray(template);
backg = rgb2gray(background);

% 画像サイズ取得
[ty, tx] = size(tempg);
[by, bx] = size(backg);

% 時間計測開始
tic
% パターンマッチング
ans_A = 0;
for j=1:(by-ty)
    for i=1:(bx-tx)
        A = backg(j:j+ty-1,i:i+tx-1) - tempg;
        sum_A = sum(sum(A));
        if i==1 && j==1
            ans_A = sum_A;
            position = [i, j, tx, ty];
        end
        if ans_A > sum_A
            ans_A = sum_A;
            position = [i, j, tx, ty];
        else
        end
    end
end

% 時間計測終了
toc

% 画像の表示
figure(1)
hAx =axes;
imshow(background, 'parent', hAx);
imrect(hAx, position);




 