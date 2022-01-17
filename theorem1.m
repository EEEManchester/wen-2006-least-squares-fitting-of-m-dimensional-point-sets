function [R,t,c,F] = theorem1(A,B)
%UMEYAMA Compute the Least Square fit rotation, translation and scalaing
%between two point sets

% expect matrix to be m-dimensions wide by n points long

assert(isequal(size(A),size(B)));

mu_a = mean(A,2);
mu_b = mean(B,2);


Am = A - mu_a;
Bm = B - mu_b;

[m,n] = size(A);

var_a = 0;
var_b = 0; 

for i=1:n 
    var_a = var_a + (norm(Am(:,i))^2)/n;
    var_b = var_b + (norm(Bm(:,i))^2)/n;
end

AB_covariance= (Bm * Am')/n;

[U,D,V] = svd(AB_covariance);


S = eye(m);

if(det(AB_covariance) <0)
   S(m,m)=-1; 
end

DS_trace = trace(D*S);

R = U*S*V.';
c = DS_trace/var_a;
t = mu_b - c*R*mu_a;

F = var_b - (DS_trace^2)/var_a;

end

