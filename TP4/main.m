clear;  %clear la mémoire
clc;    %clear le texte de la console

% --------------- INITIALISATION ---------------
disp('TP4')

% limits = [1 1; -1 1; 0 2];
% p = Plan([1 0 0]', [1 0 0]', limits);
droite = Droite([2 0 1]', [-10 0 0]');


% [bool, pt] = Calculs.Collision(d, p);

% res = Calculs.Reflexion(d.u, p.n);
droites = zeros(6,10500,6);
% Calculs.Refraction(d.u, p.n, 1, 2);
[obs, blocTrans, blocColors] = Declarations([-10 -10  15], 1, 1.5);
%Calcul des droites entre l'observateurs et les plans
for i = 1:size(blocTrans.Plans(:))
    
    pointsPlan = GetVectorPlan(blocTrans.Plans(i), obs);
    indexDroite = 0;
    
    for j = 1:size(pointsPlan,1)

        for k = 1:size(pointsPlan,2)
            
            indexDroite = indexDroite+1;
            d = Droite([pointsPlan(j,k,1) pointsPlan(j,k,2) pointsPlan(j,k,3)]', obs.Position');
            
            droites(i, indexDroite, 1:3) = d.u(1:3);
            droites(i, indexDroite, 4:6) = d.Point(1:3);
            %droites(i,indexDroite) = Droite([pointsPlan(j,k,1) pointsPlan(j,k,2) pointsPlan(j,k,3)]', obs.Position');
            
        end
    end
    

    
end

test = ExtractDroite(droites(1,10,1:6));

dedans = false;
keep = true;
collision = false;
failsafe = 0;
while keep && collision == false && failsafe < 1000;
    if dedans == false
        for i = 1:size(blocTrans.Plans(:))
            [bool, pt] = Calculs.Collision(d, blocTrans.Plans(i));
            
            if bool
                 % Si le produit scalaire est positif, le point est face au plan
                if dot([d.Point;1], blocTrans.Plans(i).Param) >= 0
                    s = Calculs.Refraction(d.u, blocTrans.Plans(i).n, 1, 1.5);
                    if norm(s) == 0
                       s = Calculs.Reflexion(d.u, blocTrans.Plans(i).n);
                    else
                        dedans = true;
                    end
                    d = Droite(s, pt);
                end
            end
        end
    else
        % Le rayon est dedans
        collision = false;
        
        % verifie collision avec le bloc de couleur
        for i = 1:size(blocColors.Plans(:))
            [bool, pt] = Calculs.Collision(d, blocColors.Plans(i));
            
            if bool
                 % Si le produit scalaire est positif, le point est face au plan
                if dot([d.Point;1], blocColors.Plans(i).Param) >= 0
                    % ON A UNE COLLISION
                    % PRENDRE LA COULEUR
                    keep = false;
                    collision = true;
                    disp('Couleur ! ')
                    disp (blocColors.GetCouleur(i));
                    break;
                end
            end
        end
        
        % Il n'y a pas eu de collision avec le bloc de couleur
        if collision == false
            for i = 1:size(blocTrans.Plans(:))
                [bool, pt] = Calculs.Collision(d, blocTrans.Plans(i));
            
                if bool
                    % Si le produit scalaire est negatif, le point est derriere le plan
                    if dot([d.Point;1], blocTrans.Plans(i).Param) <= 0
                        s = Calculs.Refraction(d.u, blocTrans.Plans(i).n, 1, 1.5);
                        if norm(s) == 0
                            s = Calculs.Reflexion(d.u, blocTrans.Plans(i).n);
                            d = Droite(s, pt);
                        else
                            % Le rayon quitte le bloc. on l'elimine
                            keep = false;
                            dedans = false;
                        end
                    end
                end
            end % Fin de toutes les faces du bloc transparent
        end
    end
    failsafe = failsafe + 1;
end

disp('end');
%         if bool
%             if dedans == false
%                 Si le produit scalaire est positif, le point des face au plan
%                 if dot([d.Point;1], blocTrans.Plans(i).Param) >= 0
%                     Calculs.Refraction(d.u, blocTrans.Plans(i).n, 1, 1.5) 
%                 end
%             else
%                 if dot([d.Point;1], blocTrans.Plans(i).Param) <= 0
%                     Calculs.Refraction(d.u, blocTrans.Plans(i).n*-1, 1, 1.5) 
%                 end
%             end
%         else
%             keep = false;
%         end
%     end
% end

data = [];
for i = 1:16*16
    data = [data 79];
end

outputBmp(16, 16, data);
