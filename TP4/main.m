clear;  %clear la mémoire
clc;    %clear le texte de la console

% --------------- INITIALISATION ---------------
disp('TP4')

% limits = [1 1; -1 1; 0 2];
% p = Plan([1 0 0]', [1 0 0]', limits);
d = Droite([2 0 1]', [-10 0 0]');

% [bool, pt] = Calculs.Collision(d, p);

% res = Calculs.Reflexion(d.u, p.n);

% Calculs.Refraction(d.u, p.n, 1, 2);

[obs, blocTrans, blocColors] = Declarations([-10 -10  15], 1, 1.5);
dedans = false;
for i = 1:size(blocTrans.Plans(:))
    [bool, pt] = Calculs.Collision(d, blocTrans.Plans(i));
    if bool
        if dedans == false
            % Si le produit scalaire est positif, le point des face au plan
            if dot([d.Point;1], blocTrans.Plans(i).Param) >= 0
                Calculs.Refraction(d.u, blocTrans.Plans(i).n, 1, 1.5) 
            end
        else
            if dot([d.Point;1], blocTrans.Plans(i).Param) <= 0
                Calculs.Refraction(d.u, blocTrans.Plans(i).n*-1, 1, 1.5) 
            end
        end
    end
end
