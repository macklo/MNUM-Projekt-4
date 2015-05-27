function [ ] = zad1( podzial1,podzial2, podpkt )
wart = [8,7;10,0;0,0.3;0.001,0.02];
    [x1,x2,err1,err2,t]= rk4(podzial1, wart(podpkt,1),wart(podpkt,2),podpkt);
    [x1p,x2p,err1p,err2p,tp]= rk4(podzial2, wart(podpkt,1),wart(podpkt,2),podpkt);
    
    figure()
    hold on
    plot(x1,x2);
    plot(x1p,x2p);
title('Trajektoria');
savefig(['fig\rk4t_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2)  '.fig']);
    f= openfig(['fig\rk4t_' int2str(podpkt) '_' int2str(podzial1)  '_' int2str(podzial2) '.fig']);
    print(f, ['jpg\rk4t_' int2str(podpkt) '_' int2str(podzial1)  '_' int2str(podzial2)], '-dpng');
hold off

figure()
hold on
plot(0:(20/podzial1):20,err1)
plot(0:(20/podzial2):20,err1p)
title('B³¹d x1');
savefig(['fig\rk4e1_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    f= openfig(['fig\rk4e1_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    print(f, ['jpg\rk4e1_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) ], '-dpng');
    hold off
    
figure()
hold on
plot(0:(20/podzial1):20,err2)
plot(0:(20/podzial2):20,err2p)
title('B³¹d x2');
savefig(['fig\rk4e2_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    f= openfig(['fig\rk4e2_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    print(f, ['jpg\rk4e2_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) ], '-dpng');
    hold off
    
    figure()
    [T,Y] = ode45(@doode,[0 20],[wart(podpkt,1) wart(podpkt,2)]);
    plot(Y(:,1),Y(:,2))
    title('Trajektoria wed³ug ode45');
    savefig(['fig\rk4ode_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    f= openfig(['fig\rk4ode_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    print(f, ['jpg\rk4ode_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) ], '-dpng');
    close all
end

