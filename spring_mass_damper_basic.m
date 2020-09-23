
% Plant parameters
m = 1; % kg
b = 10; % N s/m
k = 20; % N/m
F = 1; % N

% Transfer fucntion(open loop) of basic spring mass damper system
s = tf('s'); 
plant = 1/(m*s^2 + b*s + k);

% open-loop step response
% figure(1);
% step(plant);

% open-loop step response at user defined time stamps
t = 0:0.01:1.5;
x = step(plant,t);

% figure(2);
% plot(t,x);

% closed-loop system transfer function step-responses

% P contoller
kp = 300; 
P = kp;
plant_P = plant*P;
plant_cl = feedback(plant_P,1);

figure(3);
x_p = step(plant_cl,t);
plot(t,x_p);

% PD controller
kp = 300;
kd = 10;
PD = kp + kd*s;
plant_PD = plant*PD;
plant_cl = feedback(plant_PD,1);

figure(4);
x_pd = step(plant_cl,t);
plot(t,x_pd);

% PI controller
kp = 300;
ki = 70;
PI = kp + ki/s;
plant_PI = plant*PI;
plant_cl = feedback(plant_PI,1);

figure(5);
x_pi = step(plant_cl,t);
plot(t,x_pi);

% PID controller
kp = 350;
ki = 300;
kd = 50;
PID = kp + kd*s + ki/s;
plant_PID = plant*PID;
plant_cl = feedback(plant_PID,1);

figure(6);
x_pid = step(plant_cl,t);
plot(t,x_pid);
