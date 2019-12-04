function ve = bpsk( v, prob )
%BPSK Summary of this function goes here
%   Detailed explanation goes here
    
    %% change form 0 to -1
    
    for i = 1:length(v)
       if v(i) == 0
          v(i) = -1;
       end
    end

    sigma = 1/qfuncinv(prob);
    
    for i = 1:length(v)
        ve(i) = v(i) + normrnd(0, sigma);
    end
        
end

