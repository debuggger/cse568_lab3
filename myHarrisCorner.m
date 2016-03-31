function [t1, t2, R] = myHarrisCorner(Ix, Iy, k, image)
    
    img = double(imread(image));
    img = img(:, :, 1);
    
    [~, ~, Ix, Iy] = myEdgeFilter(img, 1);
    Ix = mat2gray(abs(Ix));
    Iy = mat2gray(abs(Iy));
        
    Ix2 = Ix .^ 2;
    Iy2 = Iy .^ 2;
    Ixy = Ix .* Iy;
    
    Ix2 = convolution(Ix2, gaussianKernel(1));
    Iy2 = convolution(Iy2, gaussianKernel(1));
    Ixy = convolution(Ixy, gaussianKernel(1));
        
    t1 = (Ix2.*Iy2 - Ixy.^2); 
    t2 = (Ix2 + Iy2).^2;
    %R = im2bw(mat2gray(abs(t1 - k .* t2)), 0.4);
    R = im2bw(mat2gray(abs(t1 - k .* t2)), 0.6);
    
    figure;
    imshow(imread(image));
    hold on
    [row, col] = find(R == 1);
    plot(col, row, 'r+');
    
end


function [gau] = gaussianKernel(sigma)
     halfwid = floor(3*sigma);
     [xx,yy] = meshgrid(-halfwid:halfwid, -halfwid:halfwid);
     gau = exp(-1/(2*sigma^2) * (xx.^2 + yy.^2));
end