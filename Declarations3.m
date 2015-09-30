% Declarations

rot = Rotation(0,-pi/18,0);

% Jambe Gauche
jambeGauche = Cylindre(Forme.CylindrePlein);
jambeGauche.Longueur = 0.75;
jambeGauche.Rayon = 0.06;
jambeGauche.CentreDeMasse = [ -0.10 0 jambeGauche.Longueur/2]';
jambeGauche.MasseVolumique = 1052;
jambeGauche.CalcVolume();
jambeGauche.CalcMasse();
jambeGauche.CentreDeMasse = ((rot * jambeGauche.CentreDeMasse)' * inv(rot))' ;

% Jambe Droite
jambeDroite = Cylindre(Forme.CylindrePlein);
jambeDroite.Longueur = 0.75;
jambeDroite.Rayon = 0.06;
jambeDroite.CentreDeMasse = [ 0.10 0 jambeDroite.Longueur/2]';
jambeDroite.MasseVolumique = 1052;
jambeDroite.CalcVolume();
jambeDroite.CalcMasse();
jambeDroite.CentreDeMasse = ((rot * jambeDroite.CentreDeMasse)' * inv(rot))';


% Tronc
tronc = Cylindre(Forme.CylindrePlein);
tronc.Longueur = 0.70;
tronc.Rayon = 0.15;
tronc.CentreDeMasse = [ 0 0 jambeGauche.Longueur + (tronc.Longueur/2)]';
tronc.MasseVolumique = 953;
tronc.CalcVolume();
tronc.CalcMasse();
tronc.CentreDeMasse = ((rot * tronc.CentreDeMasse)' * inv(rot))';

% Cou
cou = Cylindre(Forme.CylindrePlein);
cou.Longueur = 0.10;
cou.Rayon = 0.04;
cou.CentreDeMasse = [ 0 0 jambeGauche.Longueur + tronc.Longueur + (cou.Longueur/2)]';
cou.MasseVolumique = tronc.MasseVolumique;
cou.CalcVolume();
cou.CalcMasse();
cou.CentreDeMasse = ((rot * cou.CentreDeMasse)' * inv(rot))';

% Bras Gauche
brasGauche = Cylindre(Forme.CylindrePlein);
brasGauche.Longueur = 0.75;
brasGauche.Rayon = 0.03;
brasGauche.CentreDeMasse = [ -(tronc.Rayon + brasGauche.Rayon) 0 jambeGauche.Longueur + tronc.Longueur - (brasGauche.Longueur/2)]';
brasGauche.MasseVolumique = 1052;
brasGauche.CalcVolume();
brasGauche.CalcMasse();
brasGauche.CentreDeMasse = ((rot * brasGauche.CentreDeMasse)' * inv(rot))';

% Bras Droit
brasDroit = Cylindre(Forme.CylindrePlein);
brasDroit.Longueur = 0.75;
brasDroit.Rayon = 0.03;
brasDroit.CentreDeMasse = [ (tronc.Rayon + brasDroit.Rayon) 0 jambeDroite.Longueur + tronc.Longueur - (brasDroit.Longueur/2)]';
brasDroit.MasseVolumique = 1052;
brasDroit.CalcVolume();
brasDroit.CalcMasse();
brasDroit.CentreDeMasse = ((rot * brasDroit.CentreDeMasse)' * inv(rot))';

% Tete
tete = Sphere(Forme.SpherePleine);
tete.Rayon = 0.10;
tete.MasseVolumique = 1056;
tete.CentreDeMasse = [ 0 0 jambeGauche.Longueur + tronc.Longueur + cou.Longueur + tete.Rayon ]';
tete.CalcVolume();
tete.CalcMasse();
tete.CentreDeMasse = ((rot * tete.CentreDeMasse)' * inv(rot))';
