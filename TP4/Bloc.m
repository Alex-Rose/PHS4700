classdef Bloc
    %Bloc classe representant chacun des blocs
    
    properties
        Largeur
        Longueur
        Hauteur
        CDM
        n           %indice de refraction du bloc
        Plans
        
    end
    
    methods
        function obj = Bloc(lar, long, haut, indice, cdm)
            obj.Largeur = lar;
            obj.Longueur = long;
            obj.Hauteur = haut;
            obj.n = indice;
            obj.CDM = cdm;
        end
    end
    
end

