function [ p ] = prob_vector_gen()

    p = [];
    prob = 0.5;
    while prob > 10^-6
        p = [p, prob];
        prob = prob/2;
    end

end

