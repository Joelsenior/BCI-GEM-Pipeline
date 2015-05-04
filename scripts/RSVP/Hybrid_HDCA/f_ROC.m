function [ AUC, TP, FP ] = f_ROC( trueVec, falseVec, thrLength ,reversal)
% this function computes false positive and true positive rates
% for given vectors trueVec and falseVec
%% compute ROC

minVal = min([trueVec ; falseVec]);
maxVal = max([trueVec ; falseVec]);

thresholdVec = linspace(minVal,maxVal,thrLength);
if reversal
    temp = falseVec;
    falseVec = trueVec;
    trueVec = temp;
end

for idx = 1:length(thresholdVec);
    thr = thresholdVec(idx);
    TP(idx) = length(find(trueVec>thr))/length(trueVec);
    FP(idx) = length(find(falseVec>thr))/length(falseVec);
end

AUC = trapz(sort(FP),sort(TP));


end

