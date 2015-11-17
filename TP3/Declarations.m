boite = Cylindre();

boite.k = 0.1;
boite.t = [0];
boite.CentreDeMasse = [3 0 10]';
boite.Masse = 0.075;
boite.Longueur = 0.15;
boite.Rayon = 0.05;
boite.V = [ 0 0 0 ]';
boite.A = boite.Rayon^2 + boite.Longueur^2;
boite.Rot = [ 0 0 0 ]';
boite.Plans();

clf;

hold on
grid on
%axis([2.5 -0.5 9.5 3.5 1.5 10.5]);
% s = size(boite.Points(1,:));
% for i=1:s(2)
%     scatter3(boite.Points(1,i), boite.Points(2,i), boite.Points(3,i), '.r'); 
% end

balle = Sphere();
balle.Rayon = 0.0335;
balle.Masse = 0.058;
balle.t = [];
balle.CentreDeMasse = [ 0 0 2 ]';
balle.A = pi * boite.Rayon^2;
balle.k = 0.1;
balle.Plans();

% s = size(balle.Points(1,:));
% for i=1:s(2)
%     scatter3(balle.Points(1,i), balle.Points(2,i), balle.Points(3,i), '.r'); 
% end
