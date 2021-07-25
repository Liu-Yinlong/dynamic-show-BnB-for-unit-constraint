function [L,U] = estimate_LU(data,delta,B)
%ESTIMATE_LU Summary of this function goes here
%   Detailed explanation goes here
a_length=vecnorm(data);
epsilon=asin(delta./a_length);

c_3d=convert_2d_3d(B(1:2));
r=sqrt(2)*B(3);

M=abs(data'*c_3d);
L=sum(M<=delta);

U=sum(M'<=a_length.*sin(epsilon+r));

end

