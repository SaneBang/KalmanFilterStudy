% function mean = AverageFilter(input)
% 
%     n = length(input);  
% 
%     mean = zeros(1, n);
% 
%     mean(1) = input(1);
% 
%     for i = 2:n
%         mean(i) = ((i - 1) / i) * mean(i-1) + (1 / i) * input(i);
%     end
% end
% 
% 
% input = [1, 2, 3, 4, 5, 6, 7, 8]
% 
% mean = AverageFilter(input);

function avg = AvgFilter(x)

persistent prevAvg k
persistent firstRun

if isempty(firstRun)
    k = 1;
    prevAvg = 0;

    firstRun = 1;
end

alpha = (k - 1)/ k;
avg = alpha * prevAvg + (1 - alpha) * x;

prevAvg = avg;
k = k + 1;