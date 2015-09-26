clear;  %clear la mémoire
clc;    %clear le texte de la console

% Declarations

% Jambe Gauche
jambeGauche = Cylindre();
jambeGauche.Longueur = 75;
jambeGauche.Rayon = 6;
jambeGauche.CentreDeMasse = [ -10 0 jambeGauche.Longueur/2]';
jambeGauche.MasseVolumique = 0.001052; % kg/m3 = 10E-6 kg/cm3
jambeGauche.CalcVolume();
jambeGauche.CalcMasse();

% Jambe Droite
jambeDroite = Cylindre();
jambeDroite.Longueur = 75;
jambeDroite.Rayon = 6;
jambeDroite.CentreDeMasse = [ 10 0 jambeDroite.Longueur/2]';
jambeDroite.MasseVolumique = 0.001052; % kg/m3 = 10E-6 kg/cm3
jambeDroite.CalcVolume();
jambeDroite.CalcMasse();


% Tronc
tronc = Cylindre();
tronc.Longueur = 70;
tronc.Rayon = 15;
tronc.CentreDeMasse = [ 0 0 jambeGauche.Longueur + (tronc.Longueur/2)]';
tronc.MasseVolumique = 0.000953; % kg/m3 = 10E-6 kg/cm3
tronc.CalcVolume();
tronc.CalcMasse();

% Cou
cou = Cylindre();
cou.Longueur = 10;
cou.Rayon = 4;
cou.CentreDeMasse = [ 0 0 jambeGauche.Longueur + tronc.Longueur + (cou.Longueur/2)]';
cou.MasseVolumique = tronc.MasseVolumique;
cou.CalcVolume();
cou.CalcMasse();

% Bras Gauche
brasGauche = Cylindre();
brasGauche.Longueur = 75;
brasGauche.Rayon = 3;
brasGauche.CentreDeMasse = [ -13 0 jambeGauche.Longueur + tronc.Longueur - (brasGauche.Longueur/2)]';
brasGauche.MasseVolumique = 0.001052; % kg/m3 = 10E-6 kg/cm3
brasGauche.CalcVolume();
brasGauche.CalcMasse();

% Bras Droit
brasDroit = Cylindre();
brasDroit.Longueur = 75;
brasDroit.Rayon = 3;
brasDroit.CentreDeMasse = [ 13 0 jambeDroite.Longueur + tronc.Longueur - (brasDroit.Longueur/2)]';
brasDroit.MasseVolumique = 0.001052; % kg/m3 = 10E-6 kg/cm3
brasDroit.CalcVolume();
brasDroit.CalcMasse();


centreMasseGlobal = CentreDeMasse([jambeGaucheCDM], [jambeGaucheMasse]);

moment = MomentInertieForme(1.69,0.04,1.5,0,0,Forme.CylindreCreux);

AjustementInertieCentreDeMasse(moment,1.69,[0;0;0.75],[0;0;-0.538]) %voir note cours 2, c'est le bon résultat pour la tige de la boué