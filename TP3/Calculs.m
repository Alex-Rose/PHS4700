classdef Calculs
   methods(Static)
       function f = gravite(obj)
           f = [0 0 obj.Masse * -9.81];
       end
       
       function f = visqueuxBalle(obj, v)
           f = - obj.k * obj.A * v;
       end
       
       function v = vitesse(vi, a, dt)
           v = [vi(1) + a(1) * dt vi(2) + a(2) * dt vi(3) + a(3) * dt];
       end
       
       function v = vecteurEntrePoints(p1, p2) 
          v = p2 - p1;
       end
   end
end