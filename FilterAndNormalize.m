function hctsa_normalized = FilterAndNormalize()
%-------------------------------------------------------------------------------
% Steps for understanding low-dimensional representations of time-series data
%-------------------------------------------------------------------------------

%-------------------------------------------------------------------------------
% Data filter:
[groupLabels,hctsa_featureDataFilter] = TS_LabelGroups('HCTSA.mat',...
                        {'RR','ecg','gait',...
                        'riverflow','seismology',...
                        'ionosphere',...
                        'music','soundeffects','animalsounds',...
                        'shares','logr',...
                        'dynsys','map','SDE','noise'},true,true);

%-------------------------------------------------------------------------------
% Normalize:
hctsa_normalized = TS_normalize('scaledRobustSigmoid',[0.8,0.8],hctsa_featureDataFilter);

%-------------------------------------------------------------------------------
% Fill NaNs to be minimum of their column:
TS_DataMat = TS_GetFromData(hctsa_normalized,'TS_DataMat');
[ii,jj] = find(isnan(TS_DataMat));
for i = 1:length(ii)
    TS_DataMat(ii(i),jj(i)) = nanmin(TS_DataMat(:,jj(i)));
end

% Save back:
if length(ii) > 0
    fprintf(1,'Saving back %u filled-NaNs to %s\n',length(ii),hctsa_normalized);
    save(hctsa_normalized,'TS_DataMat','-append');
end

end
