clc
clear


TF=180;


%% for trimming with single engine
x0=[84.9985000000000;0;0.504800000000000;0;0;0;0;0.00590000000000000;0];


%% Control Limits

u1min=-25*pi/180;
u1max=25*pi/180;

u2min=-25*pi/180;
u2max=25*pi/180;

u3min=-30*pi/180;
u3max=30*pi/180;

u4min=0.5*pi/180;
u4max=1000*pi/180;

u5min=0.5*pi/180;
u5max=1000*pi/180;

phi0=deg2rad(47.6546);
lambda0=deg2rad(122.3075);
h0=1000;

u_offset=0*[1;1;1;1;1];
u_offset=[0;-0.178;0;0.0821;0.0821];

