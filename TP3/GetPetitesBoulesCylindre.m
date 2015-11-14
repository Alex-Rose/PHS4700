function petitesBalles= GetPetitesBoulesCylindre (rayon, hauteur,centre,nombre)

%Retourne des petites sphères a l'intérieur du cylindre
%Si nombre est pair alors le nombre de boulle retourné sera nombre +1
%ex: avec nombre = 4 on aura une boule au centre 2 en haut et 2 en bas.
%Retour : position x, y, z, rayon

    if(mod(nombre,2) == 1)
        nombre = nombre-1;
    end

    r = rayon;
    pas = (hauteur/2-r)/(nombre/2);

    petitesBalles = zeros(nombre+1,4);
    
    %Balle du centre
    petitesBalles(1,1:4) = [centre(1),centre(2),centre(3),r];
   for i = 1: 1: nombre/2
        petitesBalles(i+1,1:4) = [centre(1),centre(2),centre(3)+i*pas,r];
        petitesBalles(i+nombre/2+1,1:4) = [centre(1),centre(2),centre(3)-i*pas,r];
    end
end

