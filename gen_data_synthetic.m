function  [A,x_gt]=gen_data_synthetic(num_inlier,num_outlier,noise_level)

noise_bais=noise_level*randn(3,num_inlier+num_outlier);

x_=rand(3,1)*2-1;
x_gt=x_./norm(x_);

y=null(x_gt');

data_inlier=y*rand(2,num_inlier);
data_outlier=rand(3,num_outlier)*2-1;

data_=[data_inlier data_outlier];

ind=randperm(num_inlier+num_outlier);

data=data_(:,ind);

A_without_noise=data./vecnorm(data);

A=A_without_noise+noise_bais;

%A=A_./vecnorm(A_);

end
