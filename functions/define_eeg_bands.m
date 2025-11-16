
function bands = define_eeg_bands()
    % Defines standard EEG frequency bands
    bands.low_delta = [0.5, 2];
    bands.delta = [0.5, 4];   % Full delta range
    bands.theta = [4, 8];     
    bands.alpha = [8, 13];    
    bands.sigma = [11, 16];   % Sleep spindles
    bands.beta = [16, 35];    
end