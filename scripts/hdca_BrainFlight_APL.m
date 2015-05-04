clear all
close all
% Set Data Parameters
tstart = 0.1;
tend = 0.7;
save_on = 0; %save parameter
course = 1; %High Freq or Low Freq

% Load Ring Size Sets
load('/media/datadrive/LIINC Data/Sameer/FlightSim_APL/BFOpenLoop_BFOL707_epochData.mat')
% Contents: eegdata_highfreq_all,eegdata_lowfreq_all,workload_highfreq_all,
% workload_lowfreq_all,bad_CH,dataspan,Fs_down

time = linspace(-0.5,1.5,size(eegdata_highfreq_all,3));
twin = [round(tstart*Fs_down)+dataspan(1):round(tend*Fs_down)+dataspan(1)];
switch course
    case 0
        eeg_data = permute(eegdata_lowfreq_all,[2,3,1]);
        workloadtypes = sort(unique(workload_lowfreq_all),'descend');
        EEG_L.data = eeg_data(:,twin,find(workload_lowfreq_all==workloadtypes(1)));
        EEG_M.data = eeg_data(:,twin,find(workload_lowfreq_all==workloadtypes(2)));
        EEG_S.data = eeg_data(:,twin,find(workload_lowfreq_all==workloadtypes(3)));
    case 1
        eeg_data = permute(eegdata_highfreq_all,[2,3,1]);
        workloadtypes = sort(unique(workload_highfreq_all),'descend');
        EEG_L.data = eeg_data(:,twin,find(workload_highfreq_all==workloadtypes(1)));
        EEG_M.data = eeg_data(:,twin,find(workload_highfreq_all==workloadtypes(2)));
        EEG_S.data = eeg_data(:,twin,find(workload_highfreq_all==workloadtypes(3)));
end

clear tempL tempM tempS

% Decompose to PCA and extract first 60 components
pca = runpca(cat(2,EEG_L.data(:,:),EEG_M.data(:,:),EEG_S.data(:,:)));
X1 = reshape(pca(:,1:size(EEG_L.data(:,:),2)),size(EEG_L.data,1),size(EEG_L.data,2),size(EEG_L.data,3));
X2 = reshape(pca(:,size(EEG_L.data(:,:),2)+1:size(EEG_L.data(:,:),2)+size(EEG_M.data(:,:),2)),size(EEG_M.data,1),size(EEG_M.data,2),size(EEG_M.data,3));
X3 = reshape(pca(:,size(EEG_L.data(:,:),2)+size(EEG_M.data(:,:),2)+1:size(EEG_L.data(:,:),2)+size(EEG_M.data(:,:),2)+size(EEG_S.data(:,:),2)),size(EEG_S.data,1),size(EEG_S.data,2),size(EEG_S.data,3));

X1 = X1(1:60,:,:);
X2 = X2(1:60,:,:);
X3 = X3(1:60,:,:);



%% Run HDCA
% Truth vector
y = [ones(1,size(X1,3)) zeros(1,size(X2,3)) zeros(1,size(X3,3))]';
% Data
X = cat(3,X1,X2,X3);


winsize = 0.1;
numwin = (tend-tstart)/winsize;
winlength = floor(size(X,2)/numwin);
offset = 1:winlength:winlength*numwin-1;

[etas,w,v,fwdModel,y_level1] = RunHybridHdcaClassifier(X,y,winlength,offset,'10fold',[],cat(3,EEG_L.data,EEG_M.data,EEG_S.data));
% If cleaner data exists, use this line instead v
%[etas,w,v,fwdModel,y_level1] = RunHybridHdcaClassifier(X,y,12,[1:12:63],'10fold',[],cat(3,RAW_EEG_L.data,RAW_EEG_M.data,RAW_EEG_S.data));



%% Plot Results
eloc = readlocs('/media/datadrive/LIINC Data/Sameer/FlightSim_APL/BioSemi64.loc');
h1 = figure;
PlotHybridHdcaClassifier(fwdModel,v,eloc,linspace(150,650,6))
MakeFigureTitle(sprintf('Pilot %i Forward Models (Mean Across Folds) (uV)',707),0);

% Save Etas
etas_L = etas(1:size(X1,3));
etas_M = etas(size(X1,3)+1:size(X1,3)+size(X2,3));
etas_S = etas(size(X1,3)+size(X2,3)+1:size(X1,3)+size(X2,3)+size(X3,3));
Az = f_ROC(etas_L',[etas_M etas_S]',1000,0);
AzMS = f_ROC(etas_M',etas_S',1000,0);

% Plot Histogram
h2 = figure;
hist(etas_L)
hold on;
hist(etas_M)
hist(etas_S)

g = findobj(gca,'Type','patch');
set(g(1),'FaceColor','r','EdgeColor','w','facealpha',0.75)
set(g(2),'facealpha',0.75);
set(g(3),'FaceColor','g','facealpha',0.75);
xlabel('y values','FontSize',18);
ylabel('# of Trials','FontSize',18);
title(sprintf('Pilot %i HDCA y value histogram Az = %1.2f, MvS Az = %1.2f',707,Az,AzMS),'FontSize',18);
legend(sprintf('Large n=%i',numel(etas_L)),sprintf('Medium n=%i',numel(etas_M)),sprintf('Small n=%i',numel(etas_S)))
set(gca,'FontSize',14)


if save_on == 1
    saveas(h1,sprintf('./Figures/Pilot %i HDCA Forward Models.eps',PilotNo),'epsc');
    
    saveas(h2,sprintf('./Figures/Pilot %i HDCA Histogram.eps',PilotNo),'epsc');
    
    
    save(sprintf('./Figures/Pilot %i HDCA y values.mat',PilotNo),'etas_L','etas_M','etas_S');
end
