function [BW,maskedRGBImage] = exampleHelperHighlightField(RGB)
%exampleHelperHighlightField  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = exampleHelperHighlightField(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

%   Copyright 2022-2023 The MathWorks, Inc.

% Auto-generated by colorThresholder app on 29-Dec-2021
%------------------------------------------------------
%
% This threshold focuses on green areas and attempts to reject
% brown/yellow using the L*a*b* colorspace

% Convert RGB image to chosen color space
I = rgb2lab(RGB);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.000;
channel1Max = 32.363;

% Define thresholds for channel 2 based on histogram settings
channel2Min = -19.137;
channel2Max = 0.607;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 3.596;
channel3Max = 24.352;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
