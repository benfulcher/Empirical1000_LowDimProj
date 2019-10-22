
% Plot low-dimensional embedding:
showDist = false;
classMeth = 'none';
annotateParams = struct('n',776,'textAnnotation','ID','userInput',false,'maxL',0);
TS_PlotLowDim(hctsa_normalized,'tSNE',showDist,classMeth,annotateParams);
