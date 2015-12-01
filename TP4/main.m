clear;  %clear la mémoire
clc;    %clear le texte de la console

% --------------- INITIALISATION ---------------
disp('TP4')

% limits = [1 1; -1 1; 0 2];
% p = Plan([1 0 0]', [1 0 0]', limits);
% droite = Droite([2 0 1]', [-10 0 0]');


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


index = 1;
for i = 3:size(droites,1)   
    for j = 1:size(droites,2)
        
        if mod(j,10500) == 0
            disp('running')
        end
                
        rayon = ExtractDroite(droites(i,j,1:6));
        
%         if dot(rayon.u, blocTrans.Plans(i).n) > 0
%             break;
%         end
        
        [collision, couleur, dist] = simulateRayon(rayon, blocTrans, blocColors);
        
        if collision == true
            rayonsColl(index, 1:3) = rayon.u;
            rayonsColl(index, 4:6) = [couleur.R couleur.G couleur.B];
            rayonsColl(index, 7) = dist;
            index = index + 1;
        end
    end
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
