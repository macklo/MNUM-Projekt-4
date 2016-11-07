function [ x1,x2, err1, err2, t ] = rk4( podzial,war1, war2, podpkt)
skok=20/(podzial);
skokh=20/(podzial*2);
x1(1)=war1;
x2(1)=war2;
x1h(1)=war1;
x2h(1)=war2;
tic
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
    
    x1ht(1) = x1h(i);
    x2ht(1) = x2h(i);
    for j = 1:2  
        k11 = p1(x1ht(j),x2ht(j));
        k12 = p2(x1ht(j),x2ht(j));
        k21 = p1(x1ht(j) + 0.5*skokh*k11, x2ht(j) + 0.5*skokh*k12);
        k22 = p2(x1ht(j) + 0.5*skokh*k11, x2ht(j) + 0.5*skokh*k12);
        k31 = p1(x1ht(j) + 0.5*skokh*k21, x2ht(j) + 0.5*skokh*k22);
        k32 = p2(x1ht(j) + 0.5*skokh*k21, x2ht(j) + 0.5*skokh*k22);
        k41 = p1(x1ht(j) + skokh*k31, x2ht(j) + skokh*k32);
        k42 = p2(x1ht(j) + skokh*k31, x2ht(j) + skokh*k32);
        x1ht(j+1) = x1ht(j) + (1/6)*skokh*(k11 + 2*k21 + 2*k31 + k41);
        x2ht(j+1) = x2ht(j) + (1/6)*skokh*(k12 + 2*k22 + 2*k32 + k42);
    end
    x1h(i+1)=x1ht(3);
    x2h(i+1)=x2ht(3);
end
err1 =(16/15) * abs(x1h - x1);
err2 =(16/15) * abs(x2h - x2);
t = toc;
end

