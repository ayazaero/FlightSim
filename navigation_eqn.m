function [out_ned] = navigation_eqn(X)
V_b=[X(1);X(2);X(3)];
C1v=[cos(X(9)) sin(X(9)) 0;
    -sin(X(9)) cos(X(9)) 0;
    0 0 1];

C21 = [cos(X(8)) 0 -sin(X(8));
    0 1 0;
    sin(X(8)) 0 cos(X(8))];

Cb2 = [1 0 0;
    0 cos(X(7)) sin(X(7));
    0 -sin(X(7)) cos(X(7))];

Cbv=Cb2*C21*C1v;
Cvb=Cbv';

out_ned = Cvb*V_b;

end

