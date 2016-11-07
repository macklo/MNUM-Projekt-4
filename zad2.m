function [ t  ] = zad2( podzial1,podzial2, podpkt )
wart = [8,7;10,0;0,0.3;0.001,0.02];
    [x1,x2,err1,err2,t]= pk(podzial1, wart(podpkt,1),wart(podpkt,2),podpkt);
    [x1p,x2p,err1p,err2p,tp]= pk(podzial2, wart(podpkt,1),wart(podpkt,2),podpkt);
    
    time
    
    figure()
    hold on
    plot(x1,x2);
    plot(x1p,x2p);
title('Trajektoria');
savefig(['fig\pkt_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2)  '.fig']);
    f= openfig(['fig\pkt_' int2str(podpkt) '_' int2str(podzial1)  '_' int2str(podzial2) '.fig']);
    print(f, ['jpg\pkt_' int2str(podpkt) '_' int2str(podzial1)  '_' int2str(podzial2)], '-dpng');
hold off

figure()
hold on
plot(0:(20/podzial1):20,err1)
plot(0:(20/podzial2):20,err1p)
title('B³¹d x1');
savefig(['fig\pke1_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    f= openfig(['fig\pke1_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    print(f, ['jpg\pke1_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) ], '-dpng');
    hold off
    
figure()
hold on
plot(0:(20/podzial1):20,err2)
plot(0:(20/podzial2):20,err2p)
title('B³¹d x2');
savefig(['fig\pke2_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    f= openfig(['fig\pke2_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) '.fig']);
    print(f, ['jpg\pke2_' int2str(podpkt) '_' int2str(podzial1) '_' int2str(podzial2) ], '-dpng');
    hold off
    close all
end

