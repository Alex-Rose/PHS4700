classdef Sphere < handle
    
    properties
        Rayon
        CentreDeMasse
        Masse
        V
        W
        k
        A
        t
        Points
    end
    
    methods
        function obj = Sphere()
            obj.Rayon = 0;
            obj.Masse = 0;
        end
        
        function Plans(obj)
%            obj.Points = [];
%            n = 20;
%            m = 20;
%            for j = 0:m-1
%                for i = 0:n-1
%                    theta = i * (2 * pi / n);
%                    phi = j * ( pi / m);
%                    p1 = [ obj.CentreDeMasse(1,end) obj.CentreDeMasse(2,end) obj.CentreDeMasse(3,end) ]';
%                    p1(1) = p1(1) + obj.Rayon * sin(phi) * sin(theta);
%                    p1(2) = p1(2) + obj.Rayon * sin(phi) * cos(theta);
%                    p1(3) = p1(3) + obj.Rayon * cos(phi);
%                    
%                    obj.Points = [obj.Points p1];
%                end
%            end
           
           obj.Points = sphere;
        end
        
    end
    
end

