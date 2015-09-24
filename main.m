clear;  %clear la mémoire
clc;    %clear le texte de la console

jambeGaucheLongueur = 75;
jambeGaucheRayon = 6;
jambeGaucheMV = 0.001052; % kg/m3 = 10E-6 kg/cm3
jambeGaucheCDM = [ -10 0 jambeGaucheLongueur/2]';
jambeGaucheVolume = pi * jambeGaucheRayon^2 * jambeGaucheLongueur;
jambeGaucheMasse = jambeGaucheMV * jambeGaucheVolume;

centreMasseGlobal = CentreDeMasse([jambeGaucheCDM], [jambeGaucheMasse]);

moment = MomentInertieForme(1.69,0.04,1.5,0,0,Forme.CylindreCreux);

AjustementInertieCentreDeMasse(moment,1.69,[0;0;0.75],[0;0;-0.538]) %voir note cours 2, c'est le bon résultat pour la tige de la boué