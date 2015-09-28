function a = Acceleration( positionForce, force, centreMasseGlobal, momentInertie, vi )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

    momentForce = MomentForce(positionForce, centreMasseGlobal, force);
    
    omegaTilde = [          % wtftf this is
        0      -vi(3) vi(2);
        vi(3)  0      -vi(1);
        -vi(2) vi(1)  0;
        ];

    % momentInertie \ momentForce <=> inv(momentInertie) * momentForce
    a = momentInertie \ (momentForce + (omegaTilde * momentInertie * vi)); 

end

