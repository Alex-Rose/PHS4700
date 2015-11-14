classdef Cylindre < handle
    
    properties
        Longueur
        Rayon
        CentreDeMasse
        Masse
        V
        W
        k
        A
        t
        Rot
    end
    
    methods
        function obj = Cylindre()
            obj.Longueur = 0;
            obj.Rayon = 0;
            obj.Masse = 0;
        end
      
    end
    
end

