function [out] = trimProj(x)

Va=sqrt((x(1)^2)+(x(2)^2)+(x(3)^2));    %airspeed
theta=x(8); %Pitch angle
alpha=atan2(x(3),x(1)); %angle of attack
gam=theta-alpha;    %Flight path angle
psi=x(9);
v=0*x(2);
Z_guess=zeros(14,1);
Z_guess(1:9)=x;

% optimization using fminsearch and cost from cost_straight_level.m
[Zstar, f0] = fminsearch(@(Z) cost_straight_level(Z, Va, gam,psi,v), Z_guess, ...
    optimset('TolX', 1e-10, 'MaxFunEvals', 100000, 'MaxIter', 100000));

% Optimum solution
Xstar=Zstar(1:9);
Ustar=Zstar(10:14);

Z_guess = [Xstar;Ustar];

[Zstar, f0] = fminsearch(@(Z) cost_straight_level(Z, Va, gam,psi,v), Z_guess, ...
    optimset('TolX', 1e-10, 'MaxFunEvals', 100000, 'MaxIter', 100000));

% Optimum solution
Xstar=Zstar(1:9);
Ustar=Zstar(10:14);

save trim_values_straight_level Xstar Ustar

assignin('base', 'u_offset', Ustar);
out=Ustar;
end