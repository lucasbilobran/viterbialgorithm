function a = changez2o( a )
%CHANGEZ2O Summary of this function goes here
%   Detailed explanation goes here
    for i = 1:length(a)
       if a(i) == 0
          a(i) = -1;
       end
    end

end

