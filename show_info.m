function show_info(L,U,B,iter)
%SHOW_INFO Summary of this function goes here
%   Detailed explanation goes here
global  first_time_plot;

persistent h_l; % keep it until next iteration
persistent h_u;  
persistent h_a;  
persistent h_k;  
persistent f; 

if((first_time_plot)==0)
    first_time_plot=1;
    figure('Units','normalized','Position',[0.05,0.05,0.35,0.35]);
    title('convergence curve')
    grid on
    h_l=animatedline('Color','red','LineWidth',2);
    h_u=animatedline('Color','green','LineWidth',2);
    legend('lower bound','upper bound')
    xlabel('iteration')
    
    figure('Units','normalized','Position',[0.45,0.05,0.35,0.35]);
    title('convergence curve')
    grid on
    h_k=animatedline('Color','red','LineWidth',2);
    legend('number of branches')
    xlabel('iteration')
    
    figure('Units','normalized','Position',[0.45,0.55,0.35,0.35]);
    title('convergence curve')
    grid on
    h_a=animatedline('Color','red','LineWidth',2);
    legend('remaining area')
    xlabel('iteration')
    
    f=figure('Units','normalized','Position',[0.05,0.55,0.35,0.35]);
        
end
    addpoints(h_u,iter,U);
    addpoints(h_l,iter,L);
    
    addpoints(h_k,iter,size(B,2));
    
    addpoints(h_a,iter,sum(B(3,:).^2)*4);
    drawnow
    
    ax_bound=[-pi/2,pi/2,-pi/2,pi/2];
    area_process_radius(f,B,ax_bound);
end

