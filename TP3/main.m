clear;  %clear la mémoire
clc;    %clear le texte de la console

% --------------- INITIALISATION ---------------
disp('TP3')

Declarations();

boite.V = [ 0 0 0 ]';
% boite.W = [ 0 0 0 ]';
boite.W = [ 0 2.3 0 ]';

% balle.V = [ 6.85 0 6.85 ]'; 
% tballe = 0.66;

balle.V = [ 28 0.5 10 ]'; 
tballe = 1.1;

step = 0.0001; % Because.

t = 0;
dRot = boite.W * step;

cont = true;

while cont
    t = t + step;
    % MOVE THE BALL
    if t >= tballe
        balle.t = [ balle.t t ];
        Simulation('calculBalle', balle, 0, 0, step);
    end
    
    if boite.CentreDeMasse(3,end) > 0
        boite.t = [ boite.t t ];
        Simulation('calculBoite', boite, 0, 0, step);
        nrot = boite.Rot(1:3,end) + dRot;
        boite.Rot = [ boite.Rot nrot ];
    end
    
    [col pCol] = CollisionBalleCylindre(balle,boite);
    if(col)
        cont = false;
        t_collision = t
        boite.CentreDeMasse(1:3,end)'
        balle.CentreDeMasse(1:3,end)'
        pCol = pCol
        
        disp('point de collision - balle.cdm');
        disp(pCol - balle.CentreDeMasse(1:3,end));
        
        disp('distance entre balle.cdm et pCol');
        disp(norm(pCol - balle.CentreDeMasse(1:3,end)));
        
        disp('erreur (mm)');
        disp((0.0335 - norm(pCol - balle.CentreDeMasse(1:3,end)))*1000);
    end
    
    if balle.CentreDeMasse(3,end) - balle.Rayon <= 0
        cont = false;
    end
    
end

% PlotBall();
