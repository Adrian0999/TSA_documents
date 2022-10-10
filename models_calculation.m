syms theta;
% default_unit of motor angular theta is degree,in oder to change to rad,
%we need to multiply (pi/180),in order to change the unit to pi,we just do
%theta*pi

%assuming total length of string is 0.28 m
A=0.01;
l11=0.14;
l12=0.14;

l21=0.12;
l22=0.08;
l23=0.08;

l31=0.06;
l32=0.08;
l33=0.08;
l34=0.06;

r=0.001;
T=0.009;
k=250;

% one disc case model
delta_x11 = sqrt(l11^2-A^2)-sqrt(l11^2-(A+r*((l11/(l11+l12))*theta*pi))^2);
delta_x12 = sqrt(l12^2-A^2)-sqrt(l12^2-(A+r*((l12/(l11+l12))*theta*pi))^2);
delta_x1  = delta_x11+delta_x12;
F1=k*delta_x1;
%F1 is the ideal output force calculating with feder
diff_x1=diff(delta_x11)+diff(delta_x12);
%F11 is the output force using model calculation
F11=(diff_x1/diff(theta))*T;


% two disc case model
delta_x21 = sqrt(l21^2-A^2)-sqrt(l21^2-(A+r*((l21/(l21+l22+l23))*theta*pi))^2);
delta_x22 = sqrt(l22^2-(2*A)^2)-sqrt(l22^2-((2*A)+r*((l22/(l21+l22+l23))*theta*pi))^2);

delta_x23 = sqrt(l23^2-A^2)-sqrt(l22^2-(A+r*((l23/(l21+l22+l23))*theta*pi))^2);
delta_x2  = delta_x21+delta_x22+delta_x23;
F2=k*delta_x2;
diff_x2=diff(delta_x2);
F22=(diff_x2/diff(theta))*T;


% three disc case model
delta_x31 = sqrt(l31^2-A^2)-sqrt(l31^2-(A+r*((l31/(l31+l32+l33+l34))*theta*pi))^2);
delta_x32 = sqrt(l32^2-(2*A)^2)-sqrt(l32^2-((2*A)+r*((l32/(l31+l32+l33+l34))*theta*pi))^2);
delta_x33 = sqrt(l33^2-(2*A)^2)-sqrt(l33^2-((2*A)+r*((l33/(l31+l32+l33+l34))*theta*pi))^2);
delta_x34 = sqrt(l34^2-A^2)-sqrt(l34^2-(A+r*((l34/(l31+l32+l33+l34))*theta*pi))^2);
delta_x3  = delta_x31+delta_x32+delta_x33+delta_x34;
diff_x3=diff(delta_x3);
F3=k*delta_x3;

F33=(diff_x3/diff(theta))*T;
figure(4)
subplot(3,1,1);
fplot(diff(theta),[0,100])
xlabel("angular(pi)")
ylabel("F(N)")
title("one disc case")

subplot(3,1,2);
fplot(F22,[0,100])
xlabel("angular(pi)")
ylabel("F(N)")
title("two disc case")

subplot(3,1,3);
fplot(F33,[0,100])
xlabel("angular(pi)")
ylabel("F(N)")
title("three disc case")