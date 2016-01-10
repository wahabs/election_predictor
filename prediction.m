clear; clc
load election_data
data = data';
min_range = 6;
max_range = 6;
accuracy = elections(data,min_range,max_range);

% 1904-2012
years = (2012 - 4*size(accuracy,2) + 4):4:2012;

%close all
figure; plot(accuracy')
title(sprintf('How easy is it to predict the current election just by looking at the previous %d to %d?',min_range,max_range))
set(gca,'XTick',1:length(years))
set(gca,'XTickLabel',years)
ylabel('Predictability')
axis([0 length(years) 0 1])

% There seems to be an optimal range, see if we can calculate the integral
% under each range curve to find the best range (that which sweeps the most
% "predictability area")