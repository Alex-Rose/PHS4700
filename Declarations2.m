% Declarations

% Jambe Gauche
jambeGauche = Cylindre(Forme.CylindrePlein);
jambeGauche.Longueur = 75;
jambeGauche.Rayon = 6;
jambeGauche.CentreDeMasse = [ -10 0 jambeGauche.Longueur/2]';
jambeGauche.MasseVolumique = 0.001052; % kg/m3 = 10E-6 kg/cm3
jambeGauche.CalcVolume();
jambeGauche.CalcMasse();

% Jambe Droite
jambeDroite = Cylindre(Forme.CylindrePlein);
jambeDroite.Longueur = 75;
jambeDroite.Rayon = 6;
jambeDroite.CentreDeMasse = [ 10 0 jambeDroite.Longueur/2]';
jambeDroite.MasseVolumique = 0.001052; % kg/m3 = 10E-6 kg/cm3
jambeDroite.CalcVolume();
jambeDroite.CalcMasse();


% Tronc
tronc = Cylindre(Forme.CylindrePlein);
tronc.Longueur = 70;
tronc.Rayon = 15;
tronc.CentreDeMasse = [ 0 0 jambeGauche.Longueur + (tronc.Longueur/2)]';
tronc.MasseVolumique = 0.000953; % kg/m3 = 10E-6 kg/cm3
tronc.CalcVolume();
tronc.CalcMasse();

% Cou
cou = Cylindre(Forme.CylindrePlein);
cou.Longueur = 10;
cou.Rayon = 4;
cou.CentreDeMasse = [ 0 0 jambeGauche.Longueur + tronc.Longueur + (cou.Longueur/2)]';
cou.MasseVolumique = tronc.MasseVolumique;
cou.CalcVolume();
cou.CalcMasse();

% Bras Gauche
brasGauche = Cylindre(Forme.CylindrePlein);
brasGauche.Longueur = 75;
brasGauche.Rayon = 3;
brasGauche.CentreDeMasse = [ -(tronc.Rayon + brasGauche.Longueur / 2) 0 jambeGauche.Longueur + tronc.Longueur - brasGauche.Rayon]';
brasGauche.MasseVolumique = 0.001052; % kg/m3 = 10E-6 kg/cm3
brasGauche.CalcVolume();
brasGauche.CalcMasse();

% Bras Droit
brasDroit = Cylindre(Forme.CylindrePlein);
brasDroit.Longueur = 75;
brasDroit.Rayon = 3;
brasDroit.CentreDeMasse = [ (tronc.Rayon + brasDroit.Rayon) 0 jambeDroite.Longueur + tronc.Longueur - (brasDroit.Longueur/2)]';
brasDroit.MasseVolumique = 0.001052; % kg/m3 = 10E-6 kg/cm3
brasDroit.CalcVolume();
brasDroit.CalcMasse();

% Tete
tete = Sphere(Forme.SpherePleine);
tete.Rayon = 10;
tete.MasseVolumique = 0.001056; % kg/m3 = 10E-6 kg/cm3
tete.CentreDeMasse = [ 0 0 jambeGauche.Longueur + tronc.Longueur + tete.Rayon ]';
tete.CalcVolume();
tete.CalcMasse();
