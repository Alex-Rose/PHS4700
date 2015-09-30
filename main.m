clear;  %clear la m�moire
clc;    %clear le texte de la console

Declarations1

% Simuler l'inclinaison de 10deg
incline = true;

% Calcul du centre de masse global de l'objet
cdms = [ jambeGauche.CentreDeMasse jambeDroite.CentreDeMasse tronc.CentreDeMasse cou.CentreDeMasse brasGauche.CentreDeMasse brasDroit.CentreDeMasse tete.CentreDeMasse ];
masses = [ jambeGauche.Masse jambeDroite.Masse tronc.Masse cou.Masse brasGauche.Masse brasDroit.Masse tete.Masse ];
centreMasseGlobal = CentreDeMasse(cdms, masses);

centreMasseIncline = centreMasseGlobal;

if (incline)
    rot = Rotation(0,-pi/18,0);
    centreMasseIncline = (rot*centreMasseGlobal);
end

disp('Question a)')
disp('Centre de masse du patineur = ')
disp(centreMasseIncline)


% Application de la force
pointForce = [0 tete.Rayon jambeGauche.Longueur + tronc.Longueur + cou.Longueur + tete.Rayon]';

if (incline)
    pointForce = (rot*pointForce);
end

vecteurForce = [0 -200 0]';

momentForce = MomentForce(pointForce, centreMasseIncline, vecteurForce);

% Moment d'inertie
momentInertie = jambeGauche.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + jambeDroite.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + tronc.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + cou.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + brasDroit.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + brasGauche.MomentInertie(centreMasseGlobal);
momentInertie = momentInertie + tete.MomentInertie(centreMasseGlobal);

if (incline)
    momentInertie = rot*momentInertie*inv(rot);
end

disp('Question b)')
disp('Moment inertie = ')
disp(momentInertie)

% Acceleration
disp('Question c)')
acceleration = Acceleration(pointForce, vecteurForce, centreMasseIncline, momentInertie, [0 0 0]')

vi = [0 0 10]';
if (incline)
    vi = rot * vi;
end

disp('Question d)')
acceleration = Acceleration(pointForce, vecteurForce, centreMasseIncline, momentInertie, vi)

