function [Im, Ix, Iy] = myEdgeFilter(img, sigma)
    
    img = img(:, :, 1);
    Img = convolution(img, fspecial('gaussian', 5, sigma));
          
    Gy = [   1   2   1;
             0   0   0;
            -1  -2  -1
         ];
        
    Gx = rot90(Gy, 3);
    
    % Gx = [5 0 -5; 8 0 -8;5 0 -5];
    % Gy = [5 8 5; 0 0 0; -5 -8 -5];
    
    Iy = convolution(Img, Gx);
    Ix = convolution(Img, Gy);
    
    Iy = im2bw(mat2gray(abs(Iy)), 0.2);
    Ix = im2bw(mat2gray(abs(Ix)), 0.2);
    
    for j = 1:size(Iy, 2)
        for i = 2:size(Iy, 1)-1
            if(Iy(i, j) ~= max([Iy(i-1, j) Iy(i,j) Iy(i+1, j)]))
                Iy(i, j) = 0;
            end
        end
    end
    
    for i = 1:size(Ix, 1)
        for j = 2:size(Ix, 2)-1
            if(Ix(i, j) ~= max([Ix(i, j-1) Ix(i, j) Ix(i, j+1)]))
                Ix(i, j) = 0;
            end
        end
    end
    
    %Ix = convolution(Ix, fspecial('gaussian', 5, sigma));
    %Iy = convolution(Iy, fspecial('gaussian', 5, sigma));
    
    Im = Ix + Iy;
    
end


function [gau] = gaussianKernel(sigma)
     halfwid = floor(3*sigma);
     [xx,yy] = meshgrid(-halfwid:halfwid, -halfwid:halfwid);
     gau = exp(-1/(2*sigma^2) * (xx.^2 + yy.^2));
end