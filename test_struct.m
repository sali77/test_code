
clc
clear 

myFolder = 'C:\Users\Shafaat\Dropbox\Clifford_Lab_MATLAB\LAB\biopac_data\Data_C\EAvg\';
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
%% Get a list of all files in the folder with the desired file name pattern.

filePattern = fullfile(myFolder, '*.mat'); % Change to whatever pattern you need.
theFiles = dir(filePattern);
%%
for k = 1 %:2 %length(theFiles)
  baseFileName = theFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', fullFileName);
  load(fullFileName)
  record_name = fullFileName(end- 10:end-4)
  newfile = strcat(myFolder,'EI',record_name,'.mat')
end
%strcat(folder_path_manual,record_name,'_Rpeak.txt')