function [ tm ] = t(  )
wart = [8,7;10,0;0,0.3;0.001,0.02];
podzial = [1000,1000,100,100];
for i =1:4
    [x1,x2,err1,err2,tm(i,1)]= rk4(podzial(i), wart(i,1),1000,i);
    [x1,x2,err1,err2,tm(i,2)]= pk(podzial(i), wart(i,1),1000,i);
end
end

