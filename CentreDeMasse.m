function [ output_args ] = CentreDeMasse( centres, masses )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

masseTotale = sum(masses);

centre = [0;0;0];

for i = 1:numel(masses)
    x = centres(1, i);
    y = centres(2, i);
    z = centres(3, i);
    centreI = [x ; y ; z];
    poids = masses(i) / masseTotale;
    centreI = centreI * poids;
    
    centre = centre + centreI;
    
end
    
output_args = centre;

end

