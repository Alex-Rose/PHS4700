function [vBa vBo wBa wBo] = vitesses_collision( balle, boite )
    % Trouver normale a la surface au point de collision
    % Trouver position de la collision
    P = balle.CentreDeMasse - boite.CentreDeMasse

    Iba = inertie(balle.Masse, balle.Rayon, 0, true);
    Ibo = inertie(boite.Masse, boite.Rayon, boite.Longueur, false);

    tempBa = inv(Iba) * cross(cross(rBaP, norm), rBaP);
    tempBo = inv(Ibo) * cross(cross(rBoP, norm), rBoP);
    Ga = dot(norm, tempBa );
    Gb = dot(norm, tempBo);
    a = 1 / ((1 / balle.Masse) + (1 / boite.Masse) + Ga + Gb);
    vRelMoins = dot(norm, (vBaP - vBoP));
    j = -a * (1 + e) * vRelMoins;

    vBa = balle.V + j * (norm / balle.Masse + tempBa)
    vBo = boite.V + j * (norm / boite.Masse + tempBo)
    wBa = balle.W + j * inv(Iba) * cross(rBaP, norm);
    wBo = boite.W + j * inv(Ibo) * cross(rBoP, norm);
end

