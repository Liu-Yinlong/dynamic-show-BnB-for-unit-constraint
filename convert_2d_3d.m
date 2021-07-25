% p_2d=(theta)[w1,w2]'
% p_3d=[cos(theta),sin(theta)*[w1,w2]]'
function [point_3d]=convert_2d_3d(point_2d)
theta=vecnorm(point_2d);
w=point_2d./theta;
point_3d=[cos(theta);
            sin(theta)*w];
end

