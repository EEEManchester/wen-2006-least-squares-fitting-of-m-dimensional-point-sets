function [x0,F] = lemma1(corresponding_points, R_list, t_list, c_list)
%LEMMA1 Compute the x0 values which minimize the squared error

x = corresponding_points;
k = length(x);
m = length(x{1});

% compute x0

x0 = zeros(m,1);
c2_sum = 0;

for i=1:k
    R = R_list{i};
    c = c_list{i};
    t = t_list{i};
    x0 = x0 + c*R'*(x{i}'-t);
    c2_sum = c2_sum + c^2;
end

x0 = x0 / c2_sum;

% compute F
F = 0;
for i=1:k
    R = R_list{i};
    c = c_list{i};
    t = t_list{i};
    F = F + norm(x{i}'-c*R*x0-t)^2;
end
end

