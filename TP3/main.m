clear;  %clear la mémoire
clc;    %clear le texte de la console

% --------------- INITIALISATION ---------------
disp('TP3')

Declarations();

boite.V = [ 0 0 0 ]';
boite.W = [ 0 0 0 ]';

balle.V = [ 6.85 0 6.85 ]'; 
tballe = 0.66;

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
        nrot(1) = mod(nrot(1), 2*pi);
        nrot(2) = mod(nrot(2), 2*pi);
        nrot(3) = mod(nrot(3), 2*pi);
        boite.Rot = [ boite.Rot nrot ];
    end
    
    if(CollisionBalleCylindre(balle,boite) == 1)
        cont = false;
        t_collision = t
        boite.CentreDeMasse(1:3,end)'
    end
    
    if balle.CentreDeMasse(3,end) - balle.Rayon <= 0
        cont = false;
    end
    
end

PlotBall();
