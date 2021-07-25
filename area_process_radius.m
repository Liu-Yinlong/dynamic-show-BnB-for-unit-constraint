function area_process_radius(f,branches,ax_bound)
%SHOW_PROCESS Summary of this function goes here
%   Detailed explanation goes here
clf(f);
title('dynamic changing of branches')
axis(ax_bound);
hold on
NUM=size(branches,2);
for i=1:NUM
    B=[branches(1:2,i)-branches(3,i);branches(1:2,i)+branches(3,i)];
    p=get_vertex(B);
    fill(p(1,:),p(2,:),'r')
    hold on
end

end

function [Vertex] = get_vertex(B)


x_l=B(1);
y_l=B(2);

x_u=B(3);
y_u=B(4);

point_1=[x_l;y_l];
point_2=[x_u;y_l];
point_3=[x_u;y_u];
point_4=[x_l;y_u];

Vertex=[point_1,point_2,point_3,point_4];



end


