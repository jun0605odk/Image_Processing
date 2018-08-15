clear all;
close all;

% �摜�ǂݍ���
template = imread('../Image/�E�H�[���[.png');
background = imread('../Image/org.jpeg');

% �O���[�X�P�[����
tempg = rgb2gray(template);
backg = rgb2gray(background);

% �摜�T�C�Y�擾
[ty, tx] = size(tempg);
[by, bx] = size(backg);

% ���Ԍv���J�n
tic
% �p�^�[���}�b�`���O
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

% ���Ԍv���I��
toc

% �摜�̕\��
figure(1)
hAx =axes;
imshow(background, 'parent', hAx);
imrect(hAx, position);




 