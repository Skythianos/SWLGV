function [SG] = getGlobalVariation(refImg,distImg,params)
    GLRef = fgl_deriv_maxtrix_norm(params.a,refImg,params.h);
    GLDist= fgl_deriv_maxtrix_norm(params.a,distImg,params.h);

    SG=(2*GLRef.*GLDist+params.C)./(GLRef.^2+GLDist.^2+params.C);
end

