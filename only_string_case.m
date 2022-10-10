% only string case

syms theta;
l=0.14;
r=0.001;
t=0.009;
B=0.1;
delta_x=l-sqrt(l^2-(theta*pi*r)^2);

% leer lauf case(no load)
figure(5)
subplot(2,1,1)
F1=sqrt(l^2-(theta*pi*r)^2)/(r*(r*theta*pi))*t;
fplot(F1,[0,100])

subplot(2,1,2)
diff_x=diff(delta_x);
diff_theta=t/B;
F2=(diff_theta/diff_x)*t;
fplot(F2,[0,100])
