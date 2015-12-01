clear;  %clear la mémoire
clc;    %clear le texte de la console

clf

% --------------- INITIALISATION ---------------
disp('TP4')

% limits = [1 1; -1 1; 0 2];
% p = Plan([1 0 0]', [1 0 0]', limits);
% droite = Droite([2 0 1]', [-10 0 0]');
% 
% 
% % [bool, pt] = Calculs.Collision(d, p);
% 
% % res = Calculs.Reflexion(d.u, p.n);
% droites = zeros(6,10500,6);
% % Calculs.Refraction(d.u, p.n, 1, 2);
[obs, blocTrans, blocColors] = Declarations([-10 -10  15]', 1, 1.5);

droites = [];

%Calcul des droites entre l'observateurs et les plans
for i = 1:size(blocTrans.Plans(:))
    
    if dot([obs.Position;1], blocTrans.Plans(i).Param) < 0
        % le plan ne peut être vu par l'observateur
        continue 
    end
    
    ds = GetVectorPlan(blocTrans.Plans(i), obs);
    droites = [droites ds];
end


index = 1;
Rf = [];
scatter3(obs.Position(1), obs.Position(2), obs.Position(3), 'MarkerEdgeColor','k', 'MarkerFaceColor',[0 0 0]);
for i = 1:size(droites(:))   
    
        
    if mod(i,10500) == 0
        disp('running')
    end

    rayon = droites(i);

%         if dot(rayon.u, blocTrans.Plans(i).n) > 0
%             break;
%         end

    [collision, couleur, dist] = simulateRayon(rayon, blocTrans, blocColors);

    if collision == true
        Rf = horzcat(Rf, [rayon.Point + rayon.u * dist ; couleur.R ; couleur.G ; couleur.B]);
        rayonsColl(index, 1:3) = rayon.u;
        rayonsColl(index, 4:6) = [couleur.R couleur.G couleur.B];
        rayonsColl(index, 7) = dist;
        index = index + 1;
        
        %plot
        lel = rayon.Point + rayon.u * dist;
        
        hold on
        scatter3(lel(1), lel(2), lel(3), 'MarkerFaceColor', [couleur.R/255 couleur.G/255 couleur.B/255]);
        hold off
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
