% p_2d=(theta)[w1,w2]'
% p_3d=[cos(theta),sin(theta)*[w1,w2]]'
function [point_2d]=convert_3d_2d(point_3d)
ind=point_3d(1,:)<0;
point_3d(:,ind)=-point_3d(:,ind);

theta=abs(acos(point_3d(1,:)));

w=point_3d(2:3,:)./sin(theta);

point_2d=theta.*w;

end

