function [p,r,xp,yp] = correlated_EC(x,y,pltflg)
%function [p,r,xp,yp] = correlated_EC(x,y,pltflg)
%
% This function takes two vector inputs, x and y, and returns the p-value
% p, Pearson's correlation coefficient r, and an option to plot the data
% and correlation line
%
% EXAMPLE:
%   subplot(121);
%   x = rand(20,1);
%   y = x + rand(size(x)) - 0.5;
%   [p,r] = correlated_EC(x,y,1);
%   subplot(122);
%   x = rand(20,1);
%   y = rand(size(x));
%   [p,r] = correlated_EC(x,y,1); % No longer correlated

% Check inputs
if nargin < 3
    pltflg = 0;
end

if ~isvector(x) || ~isvector(y)
    error('Inputs must be vectors')
end

x = x(:);
y = y(:);

% Compute
x2 = [ones(size(x)),x];
c = x2\y;
xp = [min(x2) max(x2)];
yp = c(1) + c(2).*xp;
[r,p] = corrcoef(x,y);
r = r(2);
p = p(2);

% Plot
if pltflg
    plot(x,y,'ko','MarkerSize',10,'LineWidth',2);
    hold on;
    plot(xp,yp,'r','LineWidth',2);
    legend('Data', ...
        sprintf('y = %.2fx + %.2f',c(2),c(1)),'Location','NorthWest');
    if p < 0.01
        title(sprintf('R = %.2f | p = %.2e',r,p));
    else
        title(sprintf('R = %.2f | p = %.2f',r,p));
    end
    ax = gca;
    ax.FontSize = 16;
end

end