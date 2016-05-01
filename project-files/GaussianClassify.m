function C = GaussianClassify(M,num_classes)
% M is a struct with 4 members of data
% M.X1 is a matrix of training data
% M.y1 is a vector with class labels for M.X1
% M.X2 is a matrix of testing data
% M.y2 is a vector with class labels for M.X2
% C is a vector of classifications for each sample pixel
% num_classes is the number of classes

[N1,D1] = size(M.X1);
[N2,D2] = size(M.X2);

mu = zeros(num_classes,D1);
sigma2 = zeros(D1,D1,num_classes);
sigma2inverse = zeros(D1,D1,num_classes);
det_sigma2 = zeros(num_classes,1);
P_of_wi = zeros(num_classes,1);
C = zeros(N2,1);

for c = 1:num_classes
    % sample mean
    N = sum(M.y1 == c);
    mu(c,:) = (1/N)*sum(M.X1(M.y1 == c,:));
    P_of_wi(c,1) = N/N1;

    % sample covariance matrix (unbiased)

    for i = 1:N1
        if (M.y1(i) == c)
        vtemp = M.X1(i,:) - mu(c,:);
        sigma2(:,:,c) = sigma2(:,:,c) + (vtemp'*vtemp);
        end
    end

    sigma2(:,:,c) = (1/(N-1))*sigma2(:,:,c);

    sigma2inverse(:,:,c) = inv(sigma2(:,:,c));
    det_sigma2(c,1) = det(sigma2(:,:,c));

end

% Apply discriminant function g_i(x) to test data
for i = 1:N2
    g_itemp = 0;
    g_imax = -Inf;
    
    for c = 1:num_classes
        
        W_i = -0.5*sigma2inverse(:,:,c);
        w_i = sigma2inverse(:,:,c)*mu(c,:)';
        w_io = -0.5*mu(c,:)*sigma2inverse(:,:,c)*mu(c,:)' - 0.5*log(det_sigma2(c,1)) + log(P_of_wi(c,1));
        
        g_itemp = M.X2(i,:)*W_i*M.X2(i,:)' + w_i'*M.X2(i,:)' + w_io;

        if (g_itemp > g_imax)
            g_imax = g_itemp;
            C(i,1) = c;
        end
    end
end



