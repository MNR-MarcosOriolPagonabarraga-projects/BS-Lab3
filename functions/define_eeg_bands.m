
function bands = define_eeg_bands()
    bands.low_delta = [0.5, 2];
    bands.delta = [2, 4]; 
    bands.theta = [4, 7.5];     
    bands.alpha = [7.5, 12];    
    bands.sigma = [12, 15]; 
    bands.beta = [15, 35];    
end