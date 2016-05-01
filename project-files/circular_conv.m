function z = circular_conv(x,y)
% x and y are vectors for signals or filters.
% x and y can have different lengths.
% The shorter is padded with zeros.
% z is the circular convolution of x and y.

Nx = length(x);
Ny = length(y);
if (Nx == Ny)
    z = zeros(1,Nx);
    for k = 0:(Nx-1)
        z_temp = 0;
        for n = 0:(Nx-1)
            z_temp = z_temp + x(n+1)*y(mod((k-n),Nx) + 1);
        end
        z(k+1) = z_temp;
    end
elseif (Nx > Ny)
    y(Nx) = 0; % pad with zeros
    z = zeros(1,Nx);
    for k = 0:(Nx-1)
        z_temp = 0;
        for n = 0:(Nx-1)
            z_temp = z_temp + x(n+1)*y(mod((k-n),Nx) + 1);
        end
        z(k+1) = z_temp;
    end
else
    x(Ny) = 0; % pad with zeros
    z = zeros(1,Ny);
    for k = 0:(Ny-1)
        z_temp = 0;
        for n = 0:(Ny-1)
            z_temp = z_temp + x(n+1)*y(mod((k-n),Ny) + 1);
        end
        z(k+1) = z_temp;
    end    
end


