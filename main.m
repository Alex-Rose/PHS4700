clear;  %clear la mémoire
clc;    %clear le texte de la console

Declarations

% Calcul du centre de masse global de l'objet
cdms = [ jambeGauche.CentreDeMasse jambeDroite.CentreDeMasse tronc.CentreDeMasse cou.CentreDeMasse brasGauche.CentreDeMasse brasDroit.CentreDeMasse ];
masses = [ jambeGauche.Masse jambeDroite.Masse tronc.Masse cou.Masse brasGauche.Masse brasDroit.Masse ];
centreMasseGlobal = CentreDeMasse(cdms, masses);

disp('Centre de masse du patineur')
disp(centreMasseGlobal')

% Application de la force
pointForce = [0 tete.Rayon jambeGauche.Longueur + tronc.Longueur + cou.Longueur + tete.Rayon]';
vecteurForce = [0 -200 0]';
momentForce = MomentForce(pointForce, centreMasseGlobal, vecteurForce);

% Test
moment = MomentInertieForme(1.69,0.04,1.5,0,0,Forme.CylindreCreux);

AjustementInertieCentreDeMasse(moment,1.69,[0;0;0.75],[0;0;-0.538]); %voir note cours 2, c'est le bon résultat pour la tige de la boué