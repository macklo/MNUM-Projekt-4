function [x1,x2,t] = metodark(ile,war1,war2)
%ile- na ile punktow dzielimy przedzial
skok=20/(ile-1);
x1(1)=war1;
x2(1)=war2;
i=0;
tic
for i=0:(ile-1)
k11=po1(x1(i+1),x2(i+1));
k21=po1(x1(i+1)+0.5*skok,x2(i+1)+0.5*k11*skok);
k31=po1(x1(i+1)+0.5*skok,x2(i+1)+0.5*k21*skok);
k41=po1(x1(i+1)+skok,x2(i+1)+skok*k31);
k12=po2(x1(i+1),x2(i+1));
k22=po2(x1(i+1)+0.5*skok,x2(i+1)+0.5*k12*skok);
k32=po2(x1(i+1)+0.5*skok,x2(i+1)+0.5*k22*skok);
k42=po2(x1(i+1)+skok,x2(i+1)+skok*k32);
x1(i+2)=x1(i+1)+skok*(k11+2*k21+2*k31+k41)/6;
x2(i+2)=x2(i+1)+skok*(k12+2*k22+2*k32+k42)/6;
end
plot(x1,x2);
t=toc
end

