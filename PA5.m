nx = 50;
ny = 50;

V = zeros(1, nx*ny);
G = sparse(nx*ny, nx*ny);

for i = 1:nx
    for j = 1 : ny
        n = i + (j-1)*ny;
        
        if i == 1
            G(n,:) = 0;
            G(n,n) = 1;
        elseif i == nx
            G(n,:) = 0;
            G(n,n) = 1;
        elseif j == 1
            
            G(n,:) = 0;
            G(n,n) = 1;
        elseif j == ny
            G(n,:) = 0;
            G(n,n) = 1;
        else
            nxm = i + (j-2)*ny;
            nxp = i + (j)*ny;
            nym = i-1 + (j-1)*ny;
            nyp = i+1 + (j-1)*ny;

            G(n,n) = -4;
            
            if(i > 10 & i < 20 & j > 10 & j < 20)
                G(n,n) = -2;
            end
            
            G(n,nxm) = 1;
            G(n,nxp) = 1;
            G(n,nym) = 1;
            G(n,nyp) = 1;
            
        end
    end
end

spy(G)

[E,D] = eigs(G,9,'SM');

E1 = reshape(E(:,1), [nx, ny]);
E2 = reshape(E(:,1), [nx, ny]);
E3 = reshape(E(:,1), [nx, ny]);
E4 = reshape(E(:,1), [nx, ny]);
E5 = reshape(E(:,1), [nx, ny]);
E6 = reshape(E(:,1), [nx, ny]);
E7 = reshape(E(:,1), [nx, ny]);
E8 = reshape(E(:,1), [nx, ny]);
E9 = reshape(E(:,1), [nx, ny]);

subplot(3, 3, 1);
surf(E1);
subplot(3, 3, 2);
surf(E2);
subplot(3, 3, 3);
surf(E3);
subplot(3, 3, 4);
surf(E4);
subplot(3, 3, 5);
surf(E5);
subplot(3, 3, 6);
surf(E6);
subplot(3, 3, 7);
surf(E7);
subplot(3, 3, 8);
surf(E8);
subplot(3, 3, 9);
surf(E9);

            
            