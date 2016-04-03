function [R] = myHarrisCorner(Ix, Iy, k)
    
    Ix = mat2gray(abs(Ix));
    Iy = mat2gray(abs(Iy));
    
    Ix2 = Ix .^ 2;
    Ix2 = convolution(Ix2, fspecial('gaussian', 5, 1));
    
    Iy2 = Iy .^ 2;
    Iy2 = convolution(Iy2, fspecial('gaussian', 5, 1));
    
    Ixy = Ix .* Iy;
    Ixy = convolution(Ixy, fspecial('gaussian', 5, 1));
        
    detM = (Ix2.*Iy2 - Ixy.^2); 
    traceM2 = (Ix2 + Iy2).^2;
    
    R = mat2gray(abs(detM - k .* traceM2));
    R = im2bw(R, 0.4);
    
end


function [gau] = gaussianKernel(sigma)
     halfwid = floor(3*sigma);
     [xx,yy] = meshgrid(-halfwid:halfwid, -halfwid:halfwid);
     gau = exp(-1/(2*sigma^2) * (xx.^2 + yy.^2));
end