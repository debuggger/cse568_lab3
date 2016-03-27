function [smoothedImage, Ix, Iy] = myEdgeFilter(img, sigma)
    gauKernel = gaussianKernel(sigma);
    smoothedImage = convolution(img, gauKernel);
    smoothedImage = smoothedImage / (2*pi*sigma^2);
    
    Gx = [  -1 0 1;
            -2 0 2;
            -1 0 1];
        
    Gy = [  1 2 1;
            0 0 0;
            -1 -2 1];
    
    Ix = zeros(1)
    Iy = zeros(1)
    
    %{ 
    Ix = convolution(smoothedImage, Gx);
    Iy = convolution(smoothedImage, Gy);
    %}
end


function [gau] = gaussianKernel(sigma)
     halfwid = floor(3*sigma);
     [xx,yy] = meshgrid(-halfwid:halfwid, -halfwid:halfwid);
     gau = exp(-1/(2*sigma^2) * (xx.^2 + yy.^2));
end