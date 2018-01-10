function handwriting(str)

png = '.png';
for j = 1:length(str)
	val = str(j);
	fileName = strcat(val,png);
    
    letter = rgb2gray(imread(fileName));
    l = imbinarize(letter); 
    im = bwboundaries(l-1);
    
    im_cell = cell(length(im),1);

    for i = 1:length(im)
        im_cell{i} = im{i}(1:ceil(length(im{i})/30):end, :);
    end
    
    spline_a1 = spline(1:ceil(length(im{1})/30):length(im{1}),im_cell{1}(:,1),1:length(im{1}));
    spline_a2 = spline(1:ceil(length(im{1})/30):length(im{1}),im_cell{1}(:,2),1:length(im{1}));
    plot(spline_a1, spline_a2, 'black'); hold on;
    
    if (size(im_cell) > 1)
        spline_a3 = spline(1:ceil(length(im{2})/30):length(im{2}),im_cell{2}(:,1),1:length(im{2}));
        spline_a4 = spline(1:ceil(length(im{2})/30):length(im{2}),im_cell{2}(:,2),1:length(im{2}));
        plot(spline_a3, spline_a4, 'black'); hold on;
    end
    
    view(90, 90);
    val2 = strcat(val, '1');    
    fileName2 = strcat(val2,png);
    set(gca, 'Visible', 'off');
    saveas(gcf,val2,'png');
    clf
    
end

for i = 1:length(str)-1
    if (i==1)
        firstLetter = str(i);
        firstLetter1 = strcat(firstLetter, '1');
        fName1 = strcat(firstLetter1,png);
        firstA = imread(fName1);
    else
        firstA = newImg;
    end
    
    secondLetter = str(i+1);
    secondLetter1 = strcat(secondLetter, '1');
    fName2 = strcat(secondLetter1,png);
    firstB = imread(fName2);
    
    newImg = cat(2,firstA,firstB);
    finalImage = strcat(str,png);
    if (i == length(str)-1)
        imwrite(newImg,finalImage);
    end
end

end

