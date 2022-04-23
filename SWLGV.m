function quality = SWLGV(refImg, distImg)
    refSalMap  = getSaliencyMap(refImg);
    distSalMap = getSaliencyMap(distImg);

    refImg = double(refImg);
    distImg = double(distImg);

    if size(refImg,3)==3 
        refImg = 0.299 * double(refImg(:,:,1)) + 0.587 * double(refImg(:,:,2)) + 0.114 * double(refImg(:,:,3));
        distImg = 0.299 * double(distImg(:,:,1)) + 0.587 * double(distImg(:,:,2)) + 0.114 * double(distImg(:,:,3));
    end
    
    [refImg,distImg] = automaticDownsampling(refImg,distImg);
    [refSalMap,distSalMap] = automaticDownsampling(refSalMap,distSalMap);
    weight = max(refSalMap, distSalMap);
    
    %parameters
    params.a=0.6;
    params.h=80; 
    params.L=255;
    params.k1=0.2;
    params.k2=0.1;
    params.C=(params.k1*params.L).^2;
    params.T=(params.k2*params.L).^2;
    
    SG = getGlobalVariation(refImg,distImg,params);
    SL = getLocalVariation(refImg,distImg,params);
    
    simMap=(SG.^0.7).*(SL.^0.3);                
    quality = wmean(simMap(:),weight(:));
end


