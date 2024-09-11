clear all;clc;


dt = 0.1;
t = 0:dt:10;

Nsamples = length(t);

Xsaved = zeros(Nsamples, 2);
Zsaved = zeros(Nsamples, 1);
True_speed = zeros(Nsamples, 1);

for k=1:Nsamples
    [z, speed] = GetPos();
    True_speed(k) = speed;
    [pos, vel] = DvKalman(z);
    
    Xsaved(k,:) = [pos vel];
    Zsaved(k) = z;
end

figure;
plot(t, Zsaved(:), 'r.');
hold on; box on;
plot(t, Xsaved(:, 1));
xlabel('Time [sec]');ylabel('Position [m]');
legend('Measurements', 'Kalman Filter');

figure;
plot(t, Xsaved(:,2));
hold on; box on;
plot(t, True_speed(:), 'r:');
xlabel('Time [sec]');ylabel('Velocity [m/s]');
legend('Kalman Filter', 'True speed','Location','southeast');