classdef Cylindre < Objet & handle
    % Cylindre Objet contenant les propriétés d'un cylindre
    %   Méthodes disponibles : 
    %      - CalcVolume
    %      - CalcMasse (Hérité d'Objet)
    
    properties
        Longueur
        Rayon
    end
    
    methods
        function obj = Cylindre()
            obj = obj@Objet();
            obj.Longueur = 0;
            obj.Rayon = 0;
        end
        
        function v = CalcVolume(obj)
            if isnumeric(obj.Rayon) && isnumeric(obj.Longueur)
                if (obj.Rayon == 0)
                    warning('Rayon = 0')
                end
                if (obj.Longueur == 0)
                    warning('Longueur = 0')
                end
               obj.Volume = pi * obj.Rayon^2 * obj.Longueur; 
               v = obj.Volume;
            end
        end
        
        function m = CalcMasse(obj)
            m = CalcMasse@Objet(obj);
        end
       
    end
    
end

