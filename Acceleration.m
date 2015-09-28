function a = Acceleration( positionForce, force, centreMasseGlobal, momentInertie, vi )
%Acceleration Calcul l'acc�l�ration angulaire en fonction de force
%appliqu�e sur l'objet
%   positionForce : vecteur position d'application de la force
%   force : vecteur repr�sentant la force
%   centreMasseGlobal : position du centre de masse de l'objet
%   momentInertie : moment d'inertie de l'objet
%   vi : vecteur (colonne) vitesse angulaire initiale de l'objet

    momentForce = MomentForce(positionForce, centreMasseGlobal, force);
    
    omegaTilde = [          % wtvtf this is
        0      -vi(3) vi(2);
        vi(3)  0      -vi(1);
        -vi(2) vi(1)  0;
        ];

    % momentInertie \ momentForce <=> inv(momentInertie) * momentForce
    a = momentInertie \ (momentForce + (omegaTilde * momentInertie * vi)); 

end

