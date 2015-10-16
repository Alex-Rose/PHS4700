clear;  %clear la mémoire
clc;    %clear le texte de la console
clf;

% --------------- INITIALISATION ---------------
disp('TP2')

definitions();

Calculs.gravite(Balle)


hold on
axis([-1 20 -1 1 0 3]);

%zone
pointA = Zone.Points(:,1);
pointB = Zone.Points(:,2);
pointD = Zone.Points(:,3);
pointC = Zone.Points(:,4);
points=[pointA pointB pointC pointD]; % using the data given in the question
fill3(points(1,:), points(2,:) ,points(3,:),'r');
alpha(0.3)

%sim1
s1 = Sortie();
[result1, prise] = Simulation('g1', Vi1, Balles(1), 0, s1, Zone);
line(result1.x, result1.y, result1.z);
disp(prise)

%sim2
s = Sortie();
[result, prise] = Simulation('g1', Vi2, Balles(2), 0, s, Zone);
line(result.x, result.y, result.z);
disp(prise)

%sim3
s = Sortie();
[result, prise] = Simulation('g1', Vi3, Balles(3), 0, s, Zone);
line(result.x, result.y, result.z);
disp(prise)

%sim4
s1 = Sortie();
[result1, prise] = Simulation('g2', Vi1, Balles(4), 0, s1, Zone);
ln = line(result1.x, result1.y, result1.z);
set(ln, 'Color', 'r');
disp(prise)

%sim5
s = Sortie();
[result, prise] = Simulation('g2', Vi2, Balles(5), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'Color', 'r');
disp(prise)

%sim6
s = Sortie();
[result, prise] = Simulation('g2', Vi3, Balles(6), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'Color', 'r');
disp(prise)

%sim7
s1 = Sortie();
[result1, prise] = Simulation('g3', Vi1, Balles(7), 0, s1, Zone);
ln = line(result1.x, result1.y, result1.z);
set(ln, 'Color', 'g');
disp(prise)

%sim8
s = Sortie();
[result, prise] = Simulation('g3', Vi2, Balles(8), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'Color', 'g');
disp(prise)

%sim9
s = Sortie();
[result, prise] = Simulation('g3', Vi3, Balles(9), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'Color', 'g');
disp(prise)


grid on
hold off


title('Developement de Taylor de la fonction arctan(x) autours de 0');
xlabel('Axe des X');
ylabel('Axe des Y');
