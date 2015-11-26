function p= GetPointsPlan (plan)

    dimCarre = 0.1; %carres de 0.1 cm × 0.1 cm

    %Vérifier l'orientation du plan (XY, XZ ou YZ)

    iDim1 =0; %index de la premiere dimension
    iDim2 =0; %index de la seconde dimension
    
    %Comme les plans sont tous parallèle au axe, il y a toujours
    %un paramètre statique.
    iDim3 =0;
    
    if(plan.Param(1) == 0 && plan.Param(2) == 0) %XY
        iDim1 = 1;
        iDim2 = 2;
        iDim3 = 3;
        
    elseif (plan.Param(1) == 0 && plan.Param(3) == 0) %XZ
        iDim1 = 1;
        iDim2 = 3;
        iDim3 = 2;
    else %YZ
        iDim1 = 2;
        iDim2 = 3;
        iDim3 = 1;
    end

    %Dimension = (max-min)/pas
   % p = [(plan.Limits(iDim1,2)-plan.Limits(iDim1,1))/dimCarre:(plan.Limits(iDim2,2)-plan.Limits(iDim2,1))/dimCarre];
   % p
    
    %Boucle sur la premiere dimension, du min au max des limites avec un pas de 0.1 cm
    
    indexI = 0;
    for i = plan.Limits(iDim1,1):dimCarre:plan.Limits(iDim1,2)
        
        indexI = indexI+1;
        indexJ = 0;
        
        %Boucle sur la deuxième dimension
        for j = plan.Limits(iDim2,1):dimCarre:plan.Limits(iDim2,2)

            indexJ = indexJ+1;
            
            % Ax + By + Cz + D = 0
            point = [0,0,0];
            point(iDim1) = i;
            point(iDim2) = j;
            
            signe = -1;
            %On vérifie si le paramatre statique est positif ou negatif
            if(plan.Param(iDim3) < 0)
                signe = 1;
            end
            
            point(iDim3) = plan.Param(4) * signe; %Valeur du D
            
            %p(indexI,indexJ)= point;
            p(indexI,indexJ,1) = point(1);
            p(indexI,indexJ,2) = point(2);
            p(indexI,indexJ,3) = point(3);

        end
        
    end
    
    %indexI
    %indexJ
    
end