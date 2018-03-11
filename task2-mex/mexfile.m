cd c:\work
copyfile(fullfile(matlabroot,'extern','examples','mex','yprime.c'),'.','f')
mex yprime.c
T=1;
Y=1:4;
yprime(T,Y)
yprime(T,Y)
