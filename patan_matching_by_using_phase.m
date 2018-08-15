clear all;
close all;

% �摜�ǂݍ���
template = imread('../Image/�E�H�[���[.png');
background = imread('../Image/org.jpeg');

% �O���[�X�P�[����
tempg = rgb2gray(template);
backg = rgb2gray(background);

% �摜�T�C�Y�擾
[by, bx] = size(backg);
[ty, tx] = size(tempg);

% ���Ԍv���J�n
tic

% �t�[���G�ϊ�
Ga = fft2(backg);
Gb = fft2(tempg, by, bx);

% ��������ыt�t�[���G�ϊ�
c = real(ifft2((Ga.*conj(Gb))./abs(Ga.*conj(Gb))));

% �}�b�`���O���Ă��������肷��
[max_c, imax] = max(abs(c(:)));
[ypeak, xpeak] = find(c == max(c(:)));

% ���Ԍv�I��
toc

% �摜�̕\��
fFig = figure;
hAx =axes;
position = [xpeak(1), ypeak(1),tx,ty];
imshow(background, 'parent', hAx);
imrect(hAx, position);
