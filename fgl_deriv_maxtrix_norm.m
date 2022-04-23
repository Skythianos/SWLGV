function DM = fgl_deriv_maxtrix_norm( a, Y, h )
    %%     'horizon'
    [m,n]  = size(Y);
    J  = 0:(n-1);
    G1 = gamma( J+1 );
    G2 = gamma( a+1-J );
    s  = (-1) .^ J;
    M  = tril( ones(n) );
    T  = meshgrid( (gamma(a+1)/(h^a)) * s ./ (G1.*G2) );
    tt1=(gamma(a+1)/(h^a)) * s ./ (G1.*G2);
    for row=1:m
        R  = toeplitz( Y(row,:)' );
        Dx(row,:) = reshape(sum( R .* M .* T, 2 ), [1,n]);
    end
    %%  vertical
    Y=Y';
    [m,n]  = size(Y);
    J  = 0:(n-1);
    G1 = gamma( J+1 );
    G2 = gamma( a+1-J );
    s  = (-1) .^ J;
    M  = tril( ones(n) );
    T  = meshgrid( (gamma(a+1)/(h^a)) * s ./ (G1.*G2) );
    tt2=(gamma(a+1)/(h^a)) * s ./ (G1.*G2);
        
    for row=1:m
        R  = toeplitz( Y(row,:)' );
        Dy(row,:) = reshape(sum( R .* M .* T, 2 ), [1,n]);
    end
    Dy=Dy';
        
    DM=sqrt(Dx.^2+Dy.^2);
end