function [ x1,x2 ] = rk4( podzial,war1, war2)
% podzial - ile punktów mamy w danym przedziale (>=2)
skok=20/(podzial);
x1(1)=war1;
x2(1)=war2;
for i = 1:(podzial)
    k11 = p1(x1(i),x2(i));
    k12 = p2(x1(i),x2(i));
    k21 = p1(x1(i) + 0.5*skok*k11, x2(i) + 0.5*skok*k12);
    k22 = p2(x1(i) + 0.5*skok*k11, x2(i) + 0.5*skok*k12);
    k31 = p1(x1(i) + 0.5*skok*k21, x2(i) + 0.5*skok*k22);
    k32 = p2(x1(i) + 0.5*skok*k21, x2(i) + 0.5*skok*k22);
    k41 = p1(x1(i) + skok*k31, x2(i) + skok*k32);
    k42 = p2(x1(i) + skok*k31, x2(i) + skok*k32);
    x1(i+1) = x1(i) + (1/6)*skok*(k11 + 2*k21 + 2*k31 + k41);
    x2(i+1) = x2(i) + (1/6)*skok*(k12 + 2*k22 + 2*k32 + k42);
end
figure()
plot(x1,x2);
end

