function [SaliencyMap] = getSaliencyMap(Irgb)

    C = makecform('srgb2lab');
    lab = applycform(Irgb,C);

    %calculate saliency
    waveName = 'db5';
    [Smix, ~, ~] = funWaveletSaliency(lab,waveName);
    %Enhance the calculated saliency to obtain final saliency map
    SaliencyMap = funSaliencyEnhance(Smix);

end

