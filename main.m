
jambeGaucheLongueur = 75;
jambeGaucheRayon = 6;
jambeGaucheMV = 0.001052; % kg/m3 = 10E-6 kg/cm3
jambeGaucheCDM = [ -10 0 jambeGaucheLongueur/2]';
jambeGaucheVolume = pi * jambeGaucheRayon^2 * jambeGaucheLongueur;
jambeGaucheMasse = jambeGaucheMV * jambeGaucheVolume;

CentreDeMasse([jambeGaucheCDM], [jambeGaucheMasse])
