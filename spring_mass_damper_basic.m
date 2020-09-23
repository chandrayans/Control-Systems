
% Plant parameters
m = 1; % kg
b = 10; % N s/m
k = 20; % N/m
F = 1; % N

% Transfer fucntion of basic spring mass damper system
s = tf('s'); 
Plant = 1/(m*s^2 + b*s + k);

% open-loop step response
figure(1);
step(Plant);

%open-loop step response at user defined time stamps
t = 0:0.1:3;
x = step(Plant,t);

figure(2);
plot(t,x);