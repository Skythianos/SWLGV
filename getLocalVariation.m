function [SL] = getLocalVariation(refImg,distImg,params)
    Sx=[3 0 -3;10 0 -10;3 0 -3]/16;
    Sy=Sx';

    GxRef=conv2(refImg,Sx,'same');
    GyRef=conv2(refImg,Sy,'same');
    GRef=(sqrt(GxRef.^2+GyRef.^2).^1);

    GxDist=conv2(distImg,Sx,'same');
    GyDist=conv2(distImg,Sy,'same');
    GDist=(sqrt(GxDist.^2+GyDist.^2).^1);

    SL=(2*GRef.*GDist+params.T)./(GRef.^2+GDist.^2+params.T);
end

