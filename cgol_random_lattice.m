clear all
x=55;                 % Size of the Lattice (same as LAWE)

z = randi(2,x)'(:)' - 2;
z_prime=z;            % prepare the z prime

for k=1:1:80;                 % Number of frames
for n=x+2:1:x^2-x-1;          % one time pass

theta=0;                      % Sum the surrounding area (top equation)
for c=n-1:1:n+1;
for m=-1:1:1;
theta=theta+z(m*x+c);
endfor
endfor

z_prime(n)= round(1/5*(z(n)*acos(sin(pi/4*(theta-z(n)-9/2)))  +  (1-z(n)) * acos(sin(pi/4*(theta-z(n) + 3)))));        % bottom equation

endfor

figure(2)
title('GOL      www.buzwordsalad.com','FontWeight','bold');
xlabel("X");
ylabel("Y");
imagesc(reshape(z,x,x)')
z=z_prime;
pause
endfor
