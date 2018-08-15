clear all;
close all;

im_org = imread('../image/Parrots.bmp');

im_prev = im_org;

% 画像表示
figure(1);
subplot(2,2,1);
imshow(im_org);title('Org');

for i=1:40
    map = CalcEnergy(im_prev,3);
    
    % 画像表示
    subplot(2,2,2);
    imshow(uint8(map));title('Energy Map')
    
    %%%%%% 縦方向の処理 %%%%%
    % 画像表示
    subplot(2,2,3);
    imshow(im_prev);title('Trans');
    hold on;
    
    seam = FindSeam(map);
    for j=1:size(im_prev,1)
        plot(seam(j),j,'ro')
    end
    pause(0.5);
    im_out = DeleteSeam(im_prev,seam,3);
    im_prev = im_out;
    hold off;
    %%%%%%%%%%%%%%%%
    
    % 画像を90度回転
    im_prev = rot90(im_prev);
    
    %%%%%% 横方向の処理 %%%%%
    % 画像表示
    subplot(2,2,3);
    imshow(im_prev);title('Trans');
    hold on;
    
    seam = FindSeam(map);
    for j=1:size(im_prev,1)
        plot(seam(j),j,'bo')
    end
    pause(0.5);
    im_out = DeleteSeam(im_prev,seam,3);
    im_prev = im_out;
    hold off;
    %%%%%%%%%%%%%%%%
    
    % 画像を270度回転して元に戻す
    im_prev = rot90(im_prev,3);
    
    subplot(2,2,4);
    imshow(im_prev);title('result');
end

