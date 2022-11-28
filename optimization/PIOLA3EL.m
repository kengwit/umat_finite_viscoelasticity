function stress = PIOLA3EL(lamda)
global DFGRD0 STRETCH_NEW STATEV DTIME ...
       MU  ALPHA  KELAS  ...
       MUVIS ALPHAVIS  KVIS ETADEV ETAVOL ...
       MUVIS_2 ALPHAVIS_2  KVIS_2  ETADEV_2 ETAVOL_2  ...
       MUVIS_3 ALPHAVIS_3 KVIS_3 ETADEV_3 ETAVOL_3

DFGRD1=zeros(3,3);
DFGRD1(1,1) = STRETCH_NEW;
DFGRD1(2,2) = lamda;
DFGRD1(3,3) = lamda;
[~, ~, ~, FIRSTPIOLA, ~] = VISCOEL_OGDEN_3EL(DFGRD0, DFGRD1, STATEV, DTIME, ...
                                                             MU, ALPHA, KELAS, ...
                                                             MUVIS, ALPHAVIS, KVIS, ETADEV, ETAVOL, ...
                                                             MUVIS_2, ALPHAVIS_2, KVIS_2, ETADEV_2, ETAVOL_2, ...
                                                             MUVIS_3, ALPHAVIS_3, KVIS_3, ETADEV_3, ETAVOL_3);
stress = FIRSTPIOLA(2,2);

 