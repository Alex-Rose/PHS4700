classdef  Sortie < handle
    % Cylindre (Abstrait) Objet contenant les de base
    %   Méthodes disponibles : 
    %      - CalcMasse
    properties
        x
        y
        z
        t
    end
    
    methods
        function obj = Sortie()
            obj.x = [];
            obj.y = [];
            obj.z = [];
            obj.t = [];
        end
        
        function m = Add(obj, x, y, z, t)
            obj.x = [obj.x [x]];
            obj.y = [obj.y [y]];
            obj.z = [obj.z [z]];
            obj.t = [obj.t [t]];
            m = obj;
        end
        
    end
end