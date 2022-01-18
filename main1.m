% Wen, G., Wang, Z., Xia, S. et al. Least-squares fitting of multiple M-dimensional point sets. Visual Comput 22, 387–398 (2006). https://doi.org/10.1007/s00371-006-0022-6

% Test Data 2D points [ x1,Y2 ; x2,y2 ; ...]

clear vars
close all

Y1 = [
    0,0
    0,4
    4,0
    ];

Y2 = [
    9,1
    6,2
    8,4
    ];

% build Y
Y = {Y1,Y2};

% dimensions "m" (2 for 2D)
% number of point sets "k"
% number of points in a set "n"

k = length(Y);
[n,m]=size(Y1);

% ============
% Algorithm 1
% ============

% Initialization
Z = Y1;
epsilon = 1E-12;

loop=true;
iteration = 0;
iteration_max = 5;

while(loop && iteration<iteration_max)
    
    iteration = iteration +1;
    
    error1=0;
    error2=0;
    
    A=Z;
    
    % initilize storage for R,t,c
    R_list = cell(k,1);
    t_list = cell(k,1);
    c_list = cell(k,1);
    
    for i=1:k
        B = Y{i};
        % compute matrix R, vector t, scalar c & F
        [R,t,c,F1] = theorem1(A',B');
        % store values in list
        R_list{i} = R;
        t_list{i} = t;
        c_list{i} = c;
        error1 = error1 + F1/k;
    end
    
    for i=1:n
        x = cell(k,1);
        for j=1:k
            x{j,1} = Y{j}(i,:);
        end
        [x0,F2] = lemma1(x,R_list,t_list,c_list);
        Z(i,:)= x0;
        error2 = error2 + (F2 /(n*k));
    end
    
    delta_error = abs(error1 - error2);
    
    if(delta_error<epsilon)
        loop = false;
    end
    
    fprintf("i:%d error1:%.15f error2:%.15f delta-error:%f  \n", iteration, error1,error2,delta_error);
    
    if(iteration==1)
        % plot points for figure 3b after first iteration
        plotPoints("Fig 3b", Y1, Y2 ,transformPoints(Y1,R_list{2}, t_list{2}, c_list{2}),Z);
    end
    
end

plotPoints("Fig 3c", Y1, Y2 ,transformPoints(Y1,R_list{2}, t_list{2}, c_list{2}),Z);






