clear;  %clear la mémoire
clc;    %clear le texte de la console

% --------------- INITIALISATION ---------------
disp('TP4')

% limits = [1 1; -1 1; 0 2];
% p = Plan([1 0 0]', [1 0 0]', limits);
droite = Droite([2 0 1]', [-10 0 0]');

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

test = ExtractDroite(droites(1,10,1:6));

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

file = fopen('out.bmp', 'w');

x = 16;
y = 16;

BM = [ hex2dec('42') hex2dec('4D')];
size = x * y + hex2dec('436');
reserved = [ 0 0 0 0 ];
offset = [ hex2dec('36') hex2dec('04') 0 0 ];
dibsize = [hex2dec('28') 0 0 0];
x;
y;
nplanes = [1 0];
colors256_8bits = [ 8 0 ];
compression = [0 0 0 0];
imgSize = x * y;
unused = zeros(16);

h = fopen('header.bin');
hbytes = fread(h);
fclose(h);

data = [];
for i = 1:x*y
	data = [data 79];
end

fwrite(file, BM);
fwrite(file, size, 'integer*4');
fwrite(file, reserved);
fwrite(file, offset);
fwrite(file, dibsize);
fwrite(file, x, 'integer*4');
fwrite(file, y, 'integer*4');
fwrite(file, nplanes);
fwrite(file, colors256_8bits);
fwrite(file, compression);
fwrite(file, imgSize, 'integer*4');
fwrite(file, unused(1,:));
fwrite(file, hbytes);
fwrite(file, data);

fclose(file);