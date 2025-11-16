
function avg_order = get_ar_mdl_order(eeg_data, fs, max_order)
    % Finds the avg AR order for all 19 channels using MDL
    num_channels = size(eeg_data, 2);
    mdl_orders = zeros(num_channels, 1);
    
    % Split epoch for training/validation
    eeg_train = eeg_data(1:250, :); 
    eeg_val = eeg_data(251:500, :); 
    
    for k = 1:num_channels
        data1 = iddata(eeg_train(:, k), [], 1/fs);
        data2 = iddata(eeg_val(:, k), [], 1/fs);
        V = arxstruc(data1, data2, (1:max_order)');
        mdl_orders(k) = selstruc(V, 'mdl');
    end
    
    avg_order = round(mean(mdl_orders, 'omitnan')); % Omitnan for robustness
    
    % Safety fallback
    if isnan(avg_order) || avg_order < 1
       avg_order = 10; 
    end
end

