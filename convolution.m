function [result] = convolution(img0, h)
    
    result = double(zeros(size(img0)));
    
    M = floor(size(h, 1)/2);
    N = floor(size(h, 2)/2);
    
    [imRows, imCols] = size(img0);
    
    img = horzcat(zeros(imRows, M), img0, zeros(imRows, M));
    img = vertcat(zeros(N, imCols+2*M), img, zeros(N, imCols+2*M));
    
    h = rot90(h, 2);
    for i = 1:size(img, 1)-2*N
        for j = 1:size(img, 2)-2*M
            result(i,j) = sum(sum(h .* double(img(i:i+2*N, j:j+2*M))));
        end
    end
    
end



