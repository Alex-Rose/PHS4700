function c= EnCollision (centre1, centre2, rayon1, rayon2 )

%indique si il y a collision entre 2 sph�res
%v�rifie si la distance entre le centre des 2 sph�re est plus petit ou �gal
%� la somme des rayons.
%
%Valeur de retour : c=1 -> il ya collision
%                   c=0 -> il n'y a pas collision

    d = DistanceCentre(centre1,centre2);
    c = 0;
    if(d<=(rayon1+rayon2))
        c=1;
    end

end