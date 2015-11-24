clear;  %clear la mémoire
clc;    %clear le texte de la console

% --------------- INITIALISATION ---------------
disp('TP4')

limits = [1 1; -1 1; 0 2];
p = Plan([1 0 0]', [1 0 0]', limits);
d = Droite([-1 0 1]', [2 1 1]');

[bool, pt] = Calculs.Collision(d, p);

res = Calculs.Reflexion(d.u, p.n)

Calculs.Refraction(d.u, p.n, 1, 2)

[obs, blocTrans, blocColors] = Declarations([-10 -10  15], 1, 1.5);

