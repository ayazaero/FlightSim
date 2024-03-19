function [F0] = cost_straight_level(Z,Va_des,gam_des,psi_des,vdes)
% seperate out x and u from z
X=Z(1:9);
U=Z(10:14);

xdot=RCAM_model(X,U);   %xdot form RCAM model
theta=X(8); %Pitch angle
Va=sqrt((X(1)^2)+(X(2)^2)+(X(3)^2));    %airspeed
alpha=atan2(X(3),X(1)); %angle of attack
gam=theta-alpha;    %Flight path angle

Q=[xdot;
    Va-Va_des;
    gam-gam_des;
    X(2)-vdes;
    X(7);
    X(9)-psi_des
    U(5)];

H=diag(ones(1,15));
F0= Q'*H*Q; %cost function
end