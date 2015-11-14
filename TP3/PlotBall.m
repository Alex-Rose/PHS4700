clf;

hold on
axis([-1 15 -1 1 0 5]);

ln = line(balle.CentreDeMasse(1,1:end), balle.CentreDeMasse(2,1:end), balle.CentreDeMasse(3,1:end));
%set(ln, 'LineStyle', '-');
%set(ln, 'DisplayName', 'Simulation 1');

ln = line(boite.CentreDeMasse(1,1:end), boite.CentreDeMasse(2,1:end), boite.CentreDeMasse(3,1:end));
%set(ln, 'LineStyle', 'x');
%set(ln, 'Color', 'r');
%set(ln, 'DisplayName', 'Simulation 1');

grid on

hold off