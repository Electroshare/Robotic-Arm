% example 
% détermination des coordonnée
% détermination de le Jacobien
% détermination des efforts en statique

%variables
syms th1 th2 th3 l1 l2 l3 l4 d1

%matrices
A01 = Make_Matrice(th1, -pi/2, l1, d1);
A12 = Make_Matrice(th2, 0, l2, 0);
A23 = Make_Matrice(th3, 0, l3, 0);

%Matrice de changement de base
A03 = A01*A12*A23;

% Coordonnée dans le repère
X = A03(1,4);
Y = A03(2,4);
Z = A03(3,4);
TH = th1+th2+th3;

% Matrice Jacobien
J = [[diff(X,d1) diff(X,th1) diff(X,th2) diff(X,th3)]
    [diff(Y,d1) diff(Y,th1) diff(Y,th2) diff(Y,th3)]
    [diff(Z,d1) diff(Z,th1) diff(Z,th2) diff(Z,th3)]
    [diff(TH,d1) diff(TH,th1) diff(TH,th2) diff(TH,th3)]];

% Numériquement
% angles in rad
th1 = pi/2;
th2 = 0;
th3 = pi/2;
% distances
%d1 = 10;

%posiition in reference frame
x = round(vpa(subs(X),2));
y = round(vpa(subs(Y),2));
z = round(vpa(subs(Z),2));

% forces
F = [0;0;-10;0];

% Expression numérique approchée
C = round(vpa(subs(transpose(J)*F),2));
