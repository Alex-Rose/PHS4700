function [ output_args ] = MomentInertieCylindre( masse, rayon, longueur, largeur, hauteur, forme )
%MomentInertieCylindre Calcul le moment d'inertie d'un cylindre aligné avec
%l'axe des Z

    moment = [1 0 0 ;0 1 0;0 0 1];

    switch(forme)
        case Forme.Parallelepipede

            %Ic,xx = (m/12)(largeur^2 + hauteur^2)
            moment(1,1) = (masse/12) * (power(largeur,2) + power(hauteur,2));

            %Ic,yy = (m/12)(longueur^2 + hauteur^2)
            moment(2,2) = (masse/12) * (power(longueur,2) + power(hauteur,2));

            %Ic,zz = (m/12)(longueur^2 + largeur^2)
            moment(3,3) = (masse/12) * (power(longueur,2) + power(largeur,2));

        case Forme.SpherePleine

            %Ic,xx = Ic,yy = Ic,zz = (2m/5)(rayon^2)
            moment(1,1) = (2*masse/5) * power(rayon,2);
            moment(2,2) = moment(1,1);
            moment(3,3) = moment(1,1);

        case Forme.SphereCreuse

            %Ic,xx = Ic,yy = Ic,zz = (2m/3)(rayon^2)
            moment(1,1) = (2*masse/3) * power(rayon,2);
            moment(2,2) = moment(1,1);
            moment(3,3) = moment(1,1);

        case Forme.CylindrePlein

            %Ic,zz = (m/2)*(r^2)
            moment(3,3) = (masse / 2) * power(rayon,2);

            %Ic,xx = Ic,yy = (m/4)*(r^2) + (m/12)*(l^2)
            moment(1,1) = (masse/4) * power(rayon,2) + (masse/12)*(power(longueur,2));
            moment(2,2) = moment(1,1);

        case Forme.CylindreCreux

            %Ic,zz = (m)*(r^2)
            moment(3,3) = masse * power(rayon,2);

            %Ic,xx = Ic,yy = (m/2)*(r^2) + (m/12)*(l^2)
            moment(1,1) = (masse/2) * power(rayon,2) + (masse/12)*(power(longueur,2));
            moment(2,2) = moment(1,1);

    end
    
output_args = moment;

end

