function plotPoints(plot_title, varargin)
%PLOTPOINTS close points and polt
figure
title(plot_title);
xlim([-1 10]);
ylim([-1 6]);

hold on

for a=1:nargin-1
    points = varargin{a};
    points = [points;points(1,:)];
    
    plot(points(:,1),points(:,2));
end
hold off
end

