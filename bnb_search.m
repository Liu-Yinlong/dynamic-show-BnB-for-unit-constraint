function [x_opt] = bnb_search(data,delta)
%BNB_SEARCH Summary of this function goes here
%   Detailed explanation goes here
global  first_time_plot;
first_time_plot=0;

best_branch=[0,0,pi/2];%initial branch-> [center_x,center_y,radius]

B=[]; %queue 
L_now=0;
U_now=size(data,2);

optimal_branch=best_branch; 

iter=1;

while(1)
    
    [sub_b]=dividing(best_branch);
    [L1,U1] = estimate_LU(data,delta,sub_b(:,1));
    [L2,U2] = estimate_LU(data,delta,sub_b(:,2));
    [L3,U3] = estimate_LU(data,delta,sub_b(:,3));
    [L4,U4] = estimate_LU(data,delta,sub_b(:,4));
    
    B=[B,[sub_b;[L1 L2 L3 L4; U1 U2 U3 U4]]];
    
    show_info(L_now,U_now,B,iter);
    if(U_now-L_now<=0)
        break;
    end

    [U_now,ind_u]=max(B(end,:));
    [L_now_,ind_l]=max(B(end-1,:));
    
    if(L_now_>L_now)
        L_now=L_now_;
        optimal_branch=B(:,ind_l);
    end
    
    best_branch=B(:,ind_u);%update best possible branch
    B(:,ind_u)=[]; % take it out
    
    B(:,B(end,:)<L_now)=[]; % cutting branches

    iter=iter+1;
    
end

x_opt=convert_2d_3d(optimal_branch(1:2));

end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [sub_b]=dividing(b)
r=b(3)/2;
c1=[b(1)-r;b(2)-r];
c2=[b(1)-r;b(2)+r];
c3=[b(1)+r;b(2)-r];
c4=[b(1)+r;b(2)+r];

sub_b=[[c1 c2 c3 c4];ones(1,4)*r];
end

