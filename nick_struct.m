src = 'C:\Users\Shafaat\Dropbox\Clifford_Lab_MATLAB\LAB\biopac_data\Data_C\EAvg\';

filenames = command(src);
%%

filenames = {'yo','crap','shit','mom'};

my_struct = struct();
for file_k = 1:length(filenames)
    
    Processing code
    
    
    filename = filenames{file_k};
    pat = struc();
    pat.filename = filename;
    pat.x = ones(2,4);
    pat.y = 10*ones(100,4);
    if filename(end-6:end) == '_S.mat'
        my_struct.S(file_l) = pat
end
    
