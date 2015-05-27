function [ x1,x2,err1, err2, t ] = pk( podzial,war1, war2, podpkt )
skok=20/(podzial);
skokh=20/(podzial*2);
x1(1)=war1;
x2(1)=war2;
x1h(1)=war1;
x2h(1)=war2;
beta=[55/24,-59/24,37/24,-9/24];
betag=[251/720,646/720,-264/720,106/720,-19/720];
tic;
for i = 1:3
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
for i=5:(podzial+1)
    suma1 = 0;
    suma2 = 0;
    for j =1:4
        suma1 = suma1 + beta(j)*p1(x1(i-j), x2(i-j));
        suma2 = suma2 + beta(j)*p2(x1(i-j), x2(i-j));
    end
    x10 = x1(i-1) + skok*suma1;
    x20 = x2(i-1) + skok*suma2;
    f1 = p1(x10,x20);
    f2 = p2(x10,x20);
    suma1 = 0;
    suma2 = 0;
    for j =1:3
        suma1 = suma1 + betag(j+1)*p1(x1(i-j), x2(i-j));
        suma2 = suma2 + betag(j+1)*p2(x1(i-j), x2(i-j));
    end
    x1(i) = x1(i-1) + skok*suma1 + skok*betag(1)*f1;
    x2(i) = x2(i-1) + skok*suma2 + skok*betag(1)*f2;
    err1(i) = -(19/270)*(x10 - x1(i));
    err2(i) = -(19/270)*(x20 - x2(i));
end
t = toc;

end

