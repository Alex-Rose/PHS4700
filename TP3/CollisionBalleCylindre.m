function c= CollisionBalleCylindre (balle, cylindre)

    nbBalles = 5;

    %Vérifie l'abscence de collisiona avec la grosse balle
    gb = GetGrosseBouleCylindre(cylindre.Rayon,cylindre.Longueur,cylindre.CentreDeMasse(1:3,end)');
    
    %On vérifie si il y a collision avec la grosse boule
    c = 0;
    if(EnCollision(gb.CentreDeMasse,balle.CentreDeMasse(1:3,end)',gb.Rayon,balle.Rayon) == 1)

        petitesBalles = GetPetitesBoulesCylindre(cylindre.Rayon, cylindre.Longueur, cylindre.CentreDeMasse(1:3,end)', nbBalles);
        rot = Rotation(cylindre.Rot(1,end), cylindre.Rot(2,end), cylindre.Rot(3,end));
        
        %On vérifie si on a une collision avec une petite balle
        %balle.CentreDeMasse(1:3,end)'
        for i = 1: 1: nbBalles
            centrePbMatrice = [petitesBalles(i).CentreDeMasse(1) 0 0;...
                0 petitesBalles(i).CentreDeMasse(2) 0;...
                0 0 petitesBalles(i).CentreDeMasse(3)];
            centrePbMatrice = rot*centrePbMatrice*inv(rot);
            centrePb = [centrePbMatrice(1,1),centrePbMatrice(2,2),centrePbMatrice(3,3)];
            
            
            if(EnCollision(centrePb,balle.CentreDeMasse(1:3,end)',balle.Rayon,petitesBalles(i).Rayon) == 1)
                c = 1;
                vec = Calculs.vecteurEntrePoints(balle.CentreDeMasse(1:3,end), centrePb');
                d = DistanceCentre(balle.CentreDeMasse(1:3,end), centrePb');
                ratio = petitesBalles(i,4) / (balle.Rayon + petitesBalles(i,4));
                delta = vec * ratio;
                pointCollision = centrePb' - delta;
                break;
            end
        end
    end
end
