function gb= GetGrosseBouleCylindre (rayon, hauteur,centre)

%Retourne une sphère englobant le cylindre
%Retour : position x, y, z, rayon

r = ((hauteur/2)^2 + rayon^2)^(1/2);
gb = [centre(1),centre(2),centre(3),r];

end