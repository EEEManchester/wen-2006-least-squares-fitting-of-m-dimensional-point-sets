function transformed_points = transformPoints(points_in, R,t,c, invert_transform)
%TRANSFORMPOINTS Transform the points supplied by the specified Rotations,
%translations and scaling parameters

 if ~exist('invert_transform','var')
     % third parameter does not exist, so default it to something
      invert_transform=false;
 end
 
[k,m] = size(R);

M = eye(m+1);
M(1:k,1:k)=c.*R;
M(1:k,k+1)=t;

transformed_points = zeros(size(points_in));

for i=1:length(points_in)
    point = [points_in(i,:) 1];
    if(invert_transform)
        M = inv(M);
    end
    transformed = M*point';
    transformed_points(i,:) = transformed(1:2);
end


end

