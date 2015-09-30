clear;  %clear la m�moire
clc;    %clear le texte de la console

Declarations

% Calcul du centre de masse global de l'objet
cdms = [ jambeGauche.CentreDeMasse jambeDroite.CentreDeMasse tronc.CentreDeMasse cou.CentreDeMasse brasGauche.CentreDeMasse brasDroit.CentreDeMasse tete.CentreDeMasse ];
masses = [ jambeGauche.Masse jambeDroite.Masse tronc.Masse cou.Masse brasGauche.Masse brasDroit.Masse tete.Masse ];
centreMasseGlobal = CentreDeMasse(cdms, masses);

disp('Centre de masse du patineur')
disp(centreMasseGlobal')

% Si inclin�
% rot = Rotation(0,-pi/18,0);
% centreMasseGlobal = (rot*centreMasseGlobal)'*inv(rot);

% Application de la force
pointForce = [0 tete.Rayon jambeGauche.Longueur + tronc.Longueur + cou.Longueur + tete.Rayon]';

% Si inclin�
% pointForce = (rot*pointForce)'*inv(rot);

vecteurForce = [0 -200 0]';

% Si inclin�
% vecteurForce = (rot*vecteurForce)'*inv(rot)

momentForce = MomentForce(pointForce, centreMasseGlobal, vecteurForce);

momentInertie = jambeGauche.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + jambeDroite.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + tronc.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + cou.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + brasDroit.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + brasGauche.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + tete.MomentInertie(centreMasseGlobal)

% Si inclin�
% momentInertie = rot*momentInertie*inv(rot);

acceleration = Acceleration(pointForce, vecteurForce, centreMasseGlobal, momentInertie, [0 0 0]')

acceleration = Acceleration(pointForce, vecteurForce, centreMasseGlobal, momentInertie, [0 0 10]')

