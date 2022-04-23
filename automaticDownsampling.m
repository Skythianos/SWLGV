function [refImg,distImg] = automaticDownsampling(refImg,distImg)
    [nRows,nCols]=size(refImg);
    f = max(1,round(min(nRows,nCols)/256));
    if(f>1)
        lpf = ones(f,f);
        lpf = lpf/sum(lpf(:));
        refImg = imfilter(refImg,lpf,'symmetric','same');
        distImg = imfilter(distImg,lpf,'symmetric','same');

        refImg = refImg(1:f:end,1:f:end);
        distImg = distImg(1:f:end,1:f:end);
    end
end

