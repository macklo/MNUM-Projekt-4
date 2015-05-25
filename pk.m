function [ x1,x2 ] = pk( podzial,war1, war2 )
skok=20/(podzial);
x1(1)=war1;
x2(1)=war2;
beta=[55/24,-59/24,37/24,-9/24];
betag=[251/720,646/720,-264/720,106/720,-19/720];
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
end
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
    for j =1:4
        suma1 = suma1 + betag(j+1)*p1(x1(i-j), x2(i-j));
        suma2 = suma2 + betag(j+1)*p2(x1(i-j), x2(i-j));
    end
    x1(i) = x1(i-1) + skok*suma1 + skok*betag(1)*f1;
    x2(i) = x2(i-1) + skok*suma2 + skok*betag(1)*f2;
end
plot(x1,x2)
end

