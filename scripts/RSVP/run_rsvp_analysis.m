function [etas,w,v,fwdModel,y_level1,chanlocs,trig_all,trig_correct,Az] = run_rsvp_analysis(filedate,label_target,label_nontarget,label_trigger)
twin = [0.2 0.9];
EEG = pop_loadset('filename','Preprocessed_EEG.set','filepath',['D:\\Git\\Data\\Subject 1\\' filedate '\\Preprocessed EEG\\']);
EEG = eeg_checkset( EEG );
EEG_target = pop_epoch( EEG, label_target, [-0.5           1], 'newname', 'BDF file resampled pruned with ICA nontarget epochs', 'epochinfo', 'yes');
EEG_target = eeg_checkset( EEG_target );
EEG_target = pop_rmbase( EEG_target, [-500    0]);
EEG_nontarget = pop_epoch( EEG , label_nontarget, [-0.5           1], 'newname', 'BDF file resampled pruned with ICA nontarget epochs', 'epochinfo', 'yes');
EEG_nontarget = eeg_checkset( EEG_nontarget );
EEG_nontarget = pop_rmbase( EEG_nontarget, [-500    0]);
EEG_trig_all = pop_epoch( EEG , label_trigger, [-0.5           0.5], 'newname', 'BDF file resampled pruned with ICA nontarget epochs', 'epochinfo', 'yes');
EEG_trig_correct = pop_epoch( EEG_trig_all , label_target, [0           0.5], 'newname', 'BDF file resampled pruned with ICA nontarget epochs', 'epochinfo', 'yes');

EEG_target = pop_select(EEG_target,'time',twin);
EEG_nontarget = pop_select(EEG_nontarget,'time',twin);


EEG_target.data = EEG_target.data(1:256,:,:);
EEG_nontarget.data = EEG_nontarget.data(1:256,:,:);
pca = runpca(cat(2,EEG_target.data(:,:),EEG_nontarget.data(:,:)));
X1 = reshape(pca(:,1:size(EEG_target.data(:,:),2)),size(EEG_target.data,1),size(EEG_target.data,2),size(EEG_target.data,3));
X2 = reshape(pca(:,size(EEG_target.data(:,:),2)+1:size(EEG_target.data(:,:),2)+size(EEG_nontarget.data(:,:),2)),size(EEG_nontarget.data,1),size(EEG_nontarget.data,2),size(EEG_nontarget.data,3));
y = [ones(1,size(X1,3)) zeros(1,size(X2,3))]';
% Data
X = cat(3,X1,X2);
windows = 14;
tlen = floor(size(X1,2)/windows);
toff = 1:tlen:tlen*(windows-1);
[etas,w,v,fwdModel,y_level1,Az] = RunHybridHdcaClassifier(X,y,tlen,toff,'5fold',[],cat(3,EEG_target.data,EEG_nontarget.data));
chanlocs = EEG.chanlocs;
trig_all = size(EEG_trig_all.data,3);
trig_correct = size(EEG_trig_correct.data,3);




end