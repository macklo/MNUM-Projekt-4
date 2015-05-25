function [  ] = zad1( podz, podpkt )
wart = [8,7;10,0;0,0.3;0.001,0.02];
[x1,x2] = rk4(podz, wart(1,1),wart(1,2));
[x1h,x2h] = rk4(podz*2, wart(1,1),wart(1,2));
for i = 1:podz+1
    err1(i) = (16/15)*abs (-x1(i) + x1h(2*i-1));
    err2(i) = (16/15)*abs (-x2(i) + x2h(2*i-1));
end
figure()
plot(1:podz+1,err1)
figure()
plot(1:podz+1,err2)

end

