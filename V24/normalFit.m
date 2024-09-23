function pd1 = normalFit(z)
%CREATEFIT    Create plot of datasets and fits

% Output fitted probablility distribution: PD1

% Force all inputs to be column vectors
z = z(:);

% Prepare figure
% clf; %this causes the figures to not work in tiledlayout setup
hold on;
LegHandles = []; LegText = {};


% --- Plot data originally in dataset "Real Impedance Data"
[CdfF,CdfX] = ecdf(z,'Function','cdf');  % compute empirical cdf
BinInfo.rule = 1;
BinInfo.nbins = 30;
[~,BinEdge] = internal.stats.histbins(z,[],[],BinInfo,CdfF,CdfX);
[BinHeight,BinCenter] = ecdfhist(CdfF,CdfX,'edges',BinEdge);
hLine = bar(BinCenter,BinHeight,'hist');
set(hLine,'FaceColor','none','EdgeColor',[0.333333 0 0.666667],...
    'LineStyle','-', 'LineWidth',1);
%xlabel('S11 Real Impedance');
% %xlabel('S11 {dB} @ 433 MHz');
%ylabel('Probability Density')
LegHandles(end+1) = hLine;
LegText{end+1} = 'S11 (dB) Distribution';

% Create grid where function will be computed
XLim = get(gca,'XLim');
XLim = XLim + [-1 1] * 0.01 * diff(XLim);
XGrid = linspace(XLim(1),XLim(2),100);


% --- Create fit "Normal Fit"

% Fit this distribution to get parameter values
% To use parameter estimates from the original fit:
%     pd1 = ProbDistUnivParam('normal',[ 46.467328324, 15.36246764844])
pd1 = fitdist(z, 'normal');
YPlot = pdf(pd1,XGrid);
hLine = plot(XGrid,YPlot,'Color',[1 0 0],...
    'LineStyle','-', 'LineWidth',2,...
    'Marker','none', 'MarkerSize',6);
LegHandles(end+1) = hLine;
LegText{end+1} = 'Normal Fit';

% Adjust figure
%box on;
hold off;

% Create legend from accumulated handles and labels
% hLegend = legend(LegHandles,LegText,'Orientation', 'vertical', 'FontSize', 9, 'Location', 'northeast');
% set(hLegend,'Interpreter','none');

%Create box with the sigma and mu values
% sigma = pd1.sigma;
% mu = pd1.mu;
% 
% % dim = [0.535 .5 .3 .3];
% str = {"Mean = " + mu + "dB", "Standard Deviation = " + sigma + "dB"};
% % annotation('textbox',dim,'String',str,'FitBoxToText','on');
% annotation('textbox', 'String',str,'FitBoxToText','on');

% freq = 1/(2*pi);
% str = "Sine Wave, Frequency = " + freq + " Hz"
