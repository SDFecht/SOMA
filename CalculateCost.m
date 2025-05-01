function [output, counter] = CalculateCost(funcNo, x, counter)
counter = counter + 1;
switch funcNo
    case 1 %Rastrigin
        dim=size(x,2);
        output = sum(x.^2-10*cos(2*pi.*x))+10*dim;
    case 2 %Sphere
        output = sum(x.^2);
end