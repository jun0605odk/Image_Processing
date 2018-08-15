function map=CalcEnergy(im,dim)
im = double(im);
lap = [0 -1 0; -1 4 -1;0 -1 0];
map = abs(imfilter(im,lap,'replicate'));
if dim==3
    map = map(:,:,1) + map(:,:,2) + map(:,:,3); 
end