function out = CombinationOnes(one, total)

    ii = nchoosek(1:total,one);
    k = size(ii,1);
    out = zeros(k,total);
    out(sub2ind([k,total],(1:k)'*ones(1,one),ii)) = 1;

end