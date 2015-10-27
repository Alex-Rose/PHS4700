clear;  %clear la m�moire
clc;    %clear le texte de la console
clf;

% --------------- INITIALISATION ---------------
disp('TP2')

definitions();

Calculs.gravite(Balle)


hold on
axis([-10 20 -1 1 0 3]);

%zone
pointA = Zone.Points(:,1);
pointB = Zone.Points(:,2);
pointD = Zone.Points(:,3);
pointC = Zone.Points(:,4);
points=[pointA pointB pointC pointD]; % using the data given in the question
fill = fill3(points(1,:), points(2,:) ,points(3,:),'r');
set(fill, 'DisplayName', 'Zone de prise');
alpha(0.3)

%sim1
s1 = Sortie();
[result, prise] = Simulation('g1', Vi1, Balles(1), 0, s1, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '-');
set(ln, 'DisplayName', 'Simulation 1');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))

%sim2
s = Sortie();
[result, prise] = Simulation('g1', Vi2, Balles(2), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '--');
set(ln, 'DisplayName', 'Simulation 1');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))

%sim3
s = Sortie();
[result, prise] = Simulation('g1', Vi3, Balles(3), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '.');
set(ln, 'DisplayName', 'Simulation 3');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))

%sim4
s1 = Sortie();
[result, prise] = Simulation('g2', Vi1, Balles(4), 0, s1, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'Color', 'r');
set(ln, 'LineStyle', '-');
set(ln, 'DisplayName', 'Simulation 4');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))

%sim5
s = Sortie();
[result, prise] = Simulation('g2', Vi2, Balles(5), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '--');
set(ln, 'DisplayName', 'Simulation 5');
set(ln, 'Color', 'r');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))

%sim6
s = Sortie();
[result, prise] = Simulation('g2', Vi3, Balles(6), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'Color', 'r');
set(ln, 'LineStyle', '.');
set(ln, 'DisplayName', 'Simulation 6');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))

%sim7
s1 = Sortie();
[result, prise] = Simulation('g3', Vi1, Balles(7), 0, s1, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '-');
set(ln, 'DisplayName', 'Simulation 7');
set(ln, 'Color', 'g');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))

%sim8
s = Sortie();
[result, prise] = Simulation('g3', Vi2, Balles(8), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '--');
set(ln, 'DisplayName', 'Simulation 8');
set(ln, 'Color', 'g');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))

%sim9
s = Sortie();
[result, prise] = Simulation('g3', Vi3, Balles(9), 0, s, Zone);
ln = line(result.x, result.y, result.z);
set(ln, 'LineStyle', '.');
set(ln, 'DisplayName', 'Simulation 9');
set(ln, 'Color', 'g');
disp('Prise')
disp(prise)
disp([ result.x(end) result.y(end) result.z(end)])
disp('Temps')
disp(result.t(end))


grid on
hold off


title('Trajectoire des balles');
xlabel('Axe des X');
ylabel('Axe des Y');
zlabel('Axe des Z');
