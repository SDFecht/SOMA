function [fcode, searchRangeMin, searchRangeMax] = SpecifyFunctionParameters(costFunc)
    switch costFunc
        case 1
            disp('Rastrigin function: f(x)=0; x=[0,0 ... 0]');
            fcode = 1;
            searchRangeMin = -5.12;
            searchRangeMax = 5.12;
        case 2 
            disp('Sphere function: f(x)=0; x=[0,0 ... 0]');
            fcode = 2;
            searchRangeMin = -100;
            searchRangeMax = 100;
    end
end