function c= CollisionBalleCylindre (balle, cylindre)

    nbBalles = 5;

    %Vérifie l'abscence de collisiona avec la grosse balle
    gb = GetGrosseBouleCylindre(cylindre.Rayon,cylindre.Longueur,cylindre.CentreDeMasse(1:3,end)');
    
    %On vérifie si il y a collision avec la grosse boule
    c = 0;
    if(EnCollision(gb.CentreDeMasse,balle.CentreDeMasse(1:3,end)',gb.Rayon,balle.Rayon) == 1)

        rot = Rotation(cylindre.Rot(1,end), cylindre.Rot(2,end), cylindre.Rot(3,end));
        
        % balle par rapport au referentiel du cylindre
        posBal = balle.CentreDeMasse(:,end) - cylindre.CentreDeMasse(1:3,end);
        
        % il faut remettre le cylindre droit, donc appliquer la rotation a
        % la balle autour du cylindre (qui est maintenant notre origine)
        posBal = rot * posBal;
        
        % projection dans le plan xy
        % si la distance entre le centre de la balle et le centre du
        % cylindre est inferieure aux deux rayons, il se peut qu'il y ait
        % une collision
        if norm(posBal(1:2)) <= balle.Rayon + cylindre.Rayon
           % projection dans le plan xz
           % si le centre de la balle se situe a la meme hauteur que le
           % cylindre (soit entre les deux extremites du cylindre) alors il
           % y a une collision
           if posBal(3) <= cylindre.Longueur / 2 && posBal(3) >= - cylindre.Longueur / 2
               disp('Collision side');
               c = 1;
           else
               % si la position en x et en y de la balle se situe a l'interieur de
               % -Rcylindre et + Rcylindre, alors la collision potentielle
               % aura lieu avec le dessus du cylindre
               if norm(posBal(1:2)) <= cylindre.Rayon
                   % si la hauteur z est moindre que hauteur du cylindre /2
                   % alors il y a une collision avec le cylindre 
                   if abs(posBal(3)) <= cylindre.Longueur / 2
                      % Trouver le point de collision 
                      disp('Collision top/bottom');
                      c = 1;
                   end
               % sinon la collision a lieu avec le rebord du cylindre. Il
               % faudra calculer la distance entre le centre de la balle et
               % le point le plus proche du cylindre
               else
                   % Vecteur unitaire de la projection du vecteur allant de
                   % l'origine au centre de la balle
                   vectProjectionU = posBal(1:2) / norm(posBal(1:2));
                   
                   % Vecteur allant de l'origine au point le plus pres de
                   % la balle sur le contour du cylindre dans la projection
                   % dans le plan xy
                   vectContourCylindre = vectProjectionU * cylindre.Rayon;
                   
                   % Distance entre le point le plus proche et le centre de
                   % la balle
                   h = cylindre.Longueur / 2;
                   
                   % On prend le haut ou le bas du cylindre
                   if posBal(3) < 0
                      h = h * -1; 
                   end
                   
                   dist = norm(posBal - [vectContourCylindre; h]);
                   
                   % Si la distance est inferieure au rayon, il y a
                   % collision avec le contour
                   if dist <= balle.Rayon
                       disp('Collision contour')
                       c = 1;
                   end
                   
               end
           end
        end
        
%         petitesBalles = GetPetitesBoulesCylindre(cylindre.Rayon, cylindre.Longueur, cylindre.CentreDeMasse(1:3,end)', nbBalles);
%         
%         
%         %On vérifie si on a une collision avec une petite balle
%         %balle.CentreDeMasse(1:3,end)'
%         for i = 1: 1: nbBalles
%             centrePbMatrice = [petitesBalles(i).CentreDeMasse(1) 0 0;...
%                 0 petitesBalles(i).CentreDeMasse(2) 0;...
%                 0 0 petitesBalles(i).CentreDeMasse(3)];
%             centrePbMatrice = rot*centrePbMatrice*inv(rot);
%             centrePb = [centrePbMatrice(1,1),centrePbMatrice(2,2),centrePbMatrice(3,3)];
%             
%             
%             if(EnCollision(centrePb,balle.CentreDeMasse(1:3,end)',balle.Rayon,petitesBalles(i).Rayon) == 1)
%                 c = 1;
%                 break;
%             end
%         end
    end
end