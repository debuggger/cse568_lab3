function [] = lab3_demo(img)

    [Im, Ix, Iy] = myEdgeFilter(img, 1);
    
    [R] = myHarrisCorner(Ix, Iy, 0.07);
    
    subplot(2, 2, 3); subimage(Im); title('Im');
    subplot(2, 2, 1); subimage(Ix); title('Ix');
    subplot(2, 2, 2); subimage(Iy); title('Iy');
    
    [row, col] = find(R == 1);
    subplot(2, 2, 4); subimage(img); title('R'); hold on; plot(col, row, 'r+');


end