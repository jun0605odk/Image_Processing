function im_out=DeleteSeam(im, seam, dim)
im_out = zeros(size(im,1),size(im,2)-1);
for i=1:size(im,1)
    if dim==1
        if seam(i)==1
            im_out(i,:) = im(i,2:end);
        elseif seam(i)==size(im,2);
            im_out(i,:) = im(i,1:end-1);
        else
            im_out(i,:) = im(i,[1:seam(i)-1 seam(i)+1:size(im,2)]);
        end;
    else
       if seam(i)==1
            im_out(i,:,1) = im(i,2:end,1);
            im_out(i,:,2) = im(i,2:end,2);
            im_out(i,:,3) = im(i,2:end,3);
        elseif seam(i)==size(im,2);
            im_out(i,:,1) = im(i,1:end-1,1);
            im_out(i,:,2) = im(i,1:end-1,2);
            im_out(i,:,3) = im(i,1:end-1,3);
        else
            im_out(i,:,1) = im(i,[1:seam(i)-1 seam(i)+1:size(im,2)],1);
            im_out(i,:,2) = im(i,[1:seam(i)-1 seam(i)+1:size(im,2)],2);
            im_out(i,:,3) = im(i,[1:seam(i)-1 seam(i)+1:size(im,2)],3);
        end;
    end;
end;
im_out=uint8(im_out);