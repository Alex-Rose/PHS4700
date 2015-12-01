function [ collision, couleur, distance ] = simulateRayon( d, blocTrans, blocColors )
    dedans = false;
    keep = true;
    collision = false;
    failsafe = 0;
    distance = 0;
    couleur = Color.Blanc;
    while keep && collision == false && failsafe < 100;
        if dedans == false
            keep = false;
            for i = 1:size(blocTrans.Plans(:))
                [bool, pt] = Calculs.Collision(d, blocTrans.Plans(i));

                if bool
                     % Si le produit scalaire est positif, le point est face au plan
                    if dot([d.Point;1], blocTrans.Plans(i).Param) >= 0
                        s = Calculs.Refraction(d.u, blocTrans.Plans(i).n, 1, 1.5);
                        if norm(s) == 0
                           s = Calculs.Reflexion(d.u, blocTrans.Plans(i).n);
                        else
                            dedans = true;
                            keep = true;
                        end
                        distance = distance + norm(d.Point - pt);
                        d = Droite(s, pt);
                    end
                end
            end
        else
            % Le rayon est dedans
            collision = false;

            % verifie collision avec le bloc de couleur
            for i = 1:size(blocColors.Plans(:))
                [bool, pt] = Calculs.Collision(d, blocColors.Plans(i));

                if bool
                     % Si le produit scalaire est positif, le point est face au plan
                    if dot([d.Point;1], blocColors.Plans(i).Param) >= 0
                        % ON A UNE COLLISION
                        % PRENDRE LA COULEUR
                        distance = distance + norm(d.Point - pt);
                        keep = false;
                        collision = true;
                        disp('Couleur ! ')
                        disp (blocColors.GetCouleur(i));
                        break;
                    end
                end
            end

            % Il n'y a pas eu de collision avec le bloc de couleur
            if collision == false
                for i = 1:size(blocTrans.Plans(:))
                    [bool, pt] = Calculs.Collision(d, blocTrans.Plans(i));

                    if bool
                        % Si le produit scalaire est negatif, le point est derriere le plan
                        if dot([d.Point;1], blocTrans.Plans(i).Param) <= 0
                            s = Calculs.Refraction(d.u, blocTrans.Plans(i).n, 1, 1.5);
                            distance = distance + norm(d.Point - pt);
                            if norm(s) == 0
                                s = Calculs.Reflexion(d.u, blocTrans.Plans(i).n);
                                d = Droite(s, pt);
                            else
                                % Il y a r?fraction, toutefois on garde la
                                % partie r?fl?chie du rayon
                                s = Calculs.Reflexion(d.u, blocTrans.Plans(i).n);
                                d = Droite(s, pt);
                            end
                        end
                    end
                end % Fin de toutes les faces du bloc transparent
            end
        end
        failsafe = failsafe + 1;
    end


end

