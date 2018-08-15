clear all;
close all;

% �摜�ǂݍ���
I1 = imread('../Image/LENNA.bmp');
I2 = imread('../Image/�ʂ������.jpg');

% trimming
I2 = imcrop(I2,[100 200 255 255]);

% �O���[�X�P�[����
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);

% �摜�T�C�Y�擾
[by bx] = size(I1);
[ty tx] = size(I2);

% �����t�[���G�ϊ�
Ga = fft2(I1);
Gb = fft2(I2);

% ���ꂼ��̑傫���ƈʑ������߂�
Ga_ang = angle(Ga);
Ga_mag = abs(Ga);
Gb_ang = angle(Gb);
Gb_mag = abs(Gb);

% �ʑ������ւ���
Ga2 = Ga_mag.*exp(j*Gb_ang);
Gb2 = Gb_mag.*exp(j*Ga_ang);

% �t�t�[���G�����ϊ�
I1_res = ifft2(Ga2);
I2_res = ifft2(Gb2);

% ���摜�̕\��
figure(1)
subplot(1,2,1)
imshow(I1);title('LENNA �����O')
subplot(1,2,2)
imshow(I2);title('�ʂ������ �����O')

% �ϊ���̉摜�̕\��
figure(2)
subplot(1,2,1)
imshow(uint8(I1_res));title('LENNA ������')
subplot(1,2,2)
imshow(uint8(I2_res));title('�ʂ������ ������')

