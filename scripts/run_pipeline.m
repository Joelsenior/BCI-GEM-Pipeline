function run_pipeline
%RUN_PIPELINE Summary of this function goes here
%   Detailed explanation goes here
load('./params/params_settings.mat')
%{
    params_settings.enable_preprocessing = 0;
    params_settings.enable_RSVP = 1;
    params_settings.enable_SSVEP = 0;
    params_settings.enable_ERN = 0;
    params_settings.enable_motor_imagery = 0;
    params_settings.enable_attention = 0;
    params_settings.enable_behavior = 0;
%}
filedate = '20150307';
%filedate = '20150310';
%filedate = '20150311';
%filedate = '20150312';

%%
if params_settings.enable_preprocessing == 1
    run_preprocess_data(filedir)
end
%%
if params_settings.enable_RSVP == 1
    
    %nontarget = mat2cell(num2str([1001:3999]'),ones(1,length([1001:3999])),4)';
    nontarget = mat2cell(num2str([2501:3999]'),ones(1,length([2501:3999])),4)';
    trig = {'111'};
    switch filedate
        case '20150307'
            target = mat2cell(num2str([5001:7999]'),ones(1,length([5001:7999])),4)';
        case '20150309'
            target = mat2cell(num2str([4001:7999]'),ones(1,length([4001:7999])),4)';
        case '20150310'
            target = mat2cell(num2str([6001:7999]'),ones(1,length([6001:7999])),4)';
        case '20150311'
            target = mat2cell(num2str([7001:8999]'),ones(1,length([7001:8999])),4)';
        case '20150312'
            target = mat2cell(num2str([8001:8999]'),ones(1,length([8001:8999])),4)';
    end
    [etas,w,v,fwdModel,y_level1,chanlocs,trig_all,trig_correct,Az]=run_rsvp_analysis(filedate,target,nontarget,trig);
    
    if ~exist(['./Analysis/Subject 1/' filedate '/RSVP/'])
        mkdir(['./Analysis/Subject 1/' filedate '/RSVP/'])
    end
    save(['./Analysis/Subject 1/' filedate '/RSVP/analysis_RSVP_values.mat'],'Az','etas','w','v','fwdModel','y_level1','chanlocs','trig_all','trig_correct')
end

%folderName = sprintf('/media/datadrive/LIINC Data/Sameer/FlightSim/Pilot_S%i/',PilotNo(i));
%tempL = dir([folderName sprintf('FlightSim_1pt0-%i-events-L-Stick.set',PilotNo(i))]);
end

