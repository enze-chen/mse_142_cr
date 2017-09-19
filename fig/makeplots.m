clear variables;

%% Double slit pattern
theta = linspace(-pi, pi, 500);
I = 4*((sin(pi*sin(theta))./(pi*sin(theta))).^2).*((cos(3*pi*sin(theta))).^2);
g1 = 0.8*exp(-(theta+.5).^2/.31)+1.5;
g2 = 0.8*exp(-(theta-.5).^2/.31)+1.5;
base1 = linspace(1.49, 1.49, 500);
base2 = linspace(-0.01, -0.01, 500);
colx1 = linspace(-pi, -0.6, 150);
colx2 = linspace(-0.4, 0.4, 150); 
colx3 = linspace(0.6, pi, 150); 
coll = linspace(3, 3, 150);

wavex = linspace(-1, 1, 300);
wave1 = linspace(4.0, 4.0, 300);
wave2 = linspace(4.4, 4.4, 300);
wave3 = linspace(4.8, 4.8, 300);
wave4 = linspace(5.2, 5.2, 300);

close all;
figure; hold all;
plot(theta, I/max(I), 'linewidth', 3);
plot(theta, g1, 'linewidth', 1);
plot(theta, g2, 'linewidth', 1);
plot(theta, base1, 'k', 'linewidth', 1);
plot(theta, base2, 'k', 'linewidth', 2.5);
plot(colx1, coll, 'k', colx2, coll, 'k', colx3, coll, 'k', 'linewidth', 4);
plot(wavex, [wave1; wave2; wave3; wave4], 'b', 'linewidth', 1.5);
annotation('arrow', [0.518 0.518], [0.733, 0.62], 'color', 'b', 'linewidth', 1.5, 'HeadLength', 15, 'HeadWidth', 10);
axis([-1.57 1.57 -0.01 5.22]);
set(gca, 'XTick', {}, 'YTick', {}, 'visible', 'off');

%% Probability Density Function
x = linspace(-2, 1, 50);
y = cos(2*x) + sin(3*x) + 0.708;

close all;
figure; hold all;
plot(x, y, 'linewidth', 2.5);
set(gca, 'XTick', {}, 'YTick', {}, 'visible', 'off');
idx = (x > -0.2) & (x < 0.75);
H = area(x(idx), y(idx));
set(H(1), 'FaceColor', 0.8*[1 1 1]);
text(-0.2, -0.15, '$a$', 'interpreter', 'latex', 'fontsize', 28);
text(0.65, -0.15, '$b$', 'interpreter', 'latex', 'fontsize', 28);
text(-1.2, 1.2, '$|\Psi(x,t)|^2$', 'interpreter', 'latex', 'fontsize', 28);

%% Stationary states
x = linspace(0, pi, 100);
p1 = sin(x);
p2 = sin(2*x);
p3 = sin(3*x);

close all;
figure; hold all;
plot(x, p3, 'linewidth', 3.5);
line([0 0], [-0.4, 1.1], 'color', 'k', 'linewidth', 2);
line([-0.4, 3.3], [0 0], 'color', 'k', 'linewidth', 2);
axis([-0.5, 3.3, -1.1, 1.1]);
set(gca, 'XTick', {}, 'YTick', {}, 'visible', 'off');
text(-0.75, 1.0, '$\psi_3(x)$', 'interpreter', 'latex', 'fontsize', 30);

%% Quantum dots
x = linspace(0, 10, 100);
y1 = exp(-(x-1.5).^2);
y2 = exp(-(x-4.0).^2);
y3 = exp(-(x-6.5).^2);

close all;
figure; hold all;
plot(x, y1, 'b', 'linewidth', 3);
plot(x, y2, 'g', 'linewidth', 3);
plot(x, y3, 'r', 'linewidth', 3);
% line([0 0], [0, 1.1], 'color', 'k', 'linewidth', 2);
% line([0, 3.3], [0 0], 'color', 'k', 'linewidth', 2);
axis([-0.01, 8, -0.01, 1.05]);
set(gca, 'XTick', {}, 'YTick', {}, 'fontsize', 20, 'linewidth', 1.5);
ylabel('Intensity (a.u.)');
xlabel('Wavelength of light (\lambda)');
text(2.0, 1.0, '2 nm', 'fontsize', 20);
text(4.3, 1.0, '3 nm', 'fontsize', 20);
text(6.8, 1.0, '5 nm', 'fontsize', 20);

%% Kronig-Penney model
warning off

% Constants
a = 2e-10; 
Emax = 100 * 1.6e-19;
hbar = 1.055e-34;
mass = 9.11e-31;

E = linspace(0, Emax, 1e5);
mu = 1*10^(0.5);
k = sqrt(2*mass*E)/hbar;
rhs = cos(k*a) + mu*sin(k*a)./(k*a);

q = acos(rhs);
ind1 = 3300:1:9421;
ind2 = 17887:1:37700;
ind3 = 48119:1:84785;
E = E/1.6e-19;

close all;
figure(1); hold all;
co = get(gca, 'ColorOrder');
plot(q(ind1), E(ind1), 'color', co(1,:), 'linewidth', 3)
plot(-q(ind1), E(ind1), 'color', co(1,:), 'linewidth', 3)
plot(q(ind2), E(ind2), 'color', co(1,:), 'linewidth', 3)
plot(-q(ind2), E(ind2), 'color', co(1,:), 'linewidth', 3)
plot(q(ind3), E(ind3), 'color', co(1,:), 'linewidth', 3)
plot(-q(ind3), E(ind3), 'color', co(1,:), 'linewidth', 3)
xlabel('q')
ylabel('Energy')
axis([-pi-0.2 pi+0.2 0 90])
set(gca, 'YTick', {}, 'fontsize', 24, 'linewidth', 1.5);
set(gca, 'box', 'off');
ax = gca;
ax.XTick = [-pi, 0, pi];
ax.XTickLabels = {'-\pi/d', '0', '\pi/d'};
line([0, 0], [0, 90], 'color', 'k', 'linestyle', '--', 'linewidth', 2);
line([pi, pi], [0, 90], 'color', 'k', 'linestyle', '--', 'linewidth', 2);
line([-pi, -pi], [0, 90], 'color', 'k', 'linestyle', '--', 'linewidth', 2);

figure(2); hold all;
plot(q(ind1), E(ind1), 'color', co(1,:), 'linewidth', 3)
plot(q(ind2)+pi, fliplr(E(ind2)), 'color', co(1,:), 'linewidth', 3)
plot(q(ind3)+2*pi, E(ind3), 'color', co(1,:), 'linewidth', 3)
xlabel('q')
ylabel('Energy')
axis([0 3*pi+0.2 0 90])
set(gca, 'XTick', {}, 'YTick', {}, 'fontsize', 24, 'linewidth', 1.5);
set(gca, 'box', 'off');
line([pi, pi], [0, 90], 'color', 'k', 'linestyle', '--', 'linewidth', 2);
line([2*pi, 2*pi], [0, 90], 'color', 'k', 'linestyle', '--', 'linewidth', 2);
line([3*pi, 3*pi], [0, 90], 'color', 'k', 'linestyle', '--', 'linewidth', 2);
ax = gca;
ax.XTick = [0, pi, 2*pi, 3*pi];
ax.XTickLabels = {'0', '\pi/d', '2\pi/d', '3\pi/d'};

%% Parabolic potential
x = linspace(-1, 9, 200);
y = 0.7*sin((x+1.7)/2) + cos(x-0.3) + 0.03*exp(x-5);
z = 0.5*(x-3.774).^2-0.661;

close all;
figure(1); hold all;
plot(x, y, 'linewidth', 4);
plot(x, z, 'k--', 'linewidth', 3.5);
axis([-1 9, -1, 2]);
set(gca, 'XTick', {}, 'YTick', {}, 'fontsize', 24, 'linewidth', 1.5);
xlabel('$x$', 'interpreter', 'latex');
ylabel('$V(x)$', 'interpreter', 'latex');

%% Hermite polynomials
a = 0.036;
x = linspace(-a, a, 1000);
m = 9e-31;
w = 1e1;
hbar = 1e-34;
C = (m*w/(pi*hbar))^0.25;
q = sqrt(m*w/hbar);
n = 50;
psi = hermiteH(n, q*x) .* exp(-q^2*x.^2/2);
% psi = C * 1/(sqrt(2^n*factorial(n))) * hermiteH(n, q*x) .* exp(-q^2*x.^2/2);
prob = psi.^2;

close all;
figure(1); hold all;
plot(x, prob, 'linewidth', 2);
axis([-1.1*a, 1.1*a, 0, 1.1*max(prob)]);
% axis([-1.1*a, 1.1*a, 1.1*min(psi), 1.1*max(psi)]);
set(gca, 'XTick', {}, 'YTick', {}, 'fontsize', 24, 'linewidth', 1.5);
xlabel('$x$', 'interpreter', 'latex');
ylabel('$|\psi_{50}(x)|^2$', 'interpreter', 'latex');

%% Casimir effect
close all;
x = linspace(-10, 10, 1000);
y = zeros(5, length(x));
y(1,:) = sin(5*x) + 12;
y(2,:) = sin(4*x) + 9;
y(3,:) = sin(2*x) + 6;
y(4,:) = sin(0.9*x) + 3;
y(5,:) = sin(0.5*x);
left = x <= 0;
right = x >= pi;

figure; hold all;
colord = get(gca, 'ColorOrder');
plot(x, y(1:3,:), 'color', colord(2,:), 'linewidth', 5);
plot(x(left), y(4:5,left), x(right), y(4:5,right), 'color', colord(2,:), 'linewidth', 5); 
plot([0, 0], [-2, 14.5], 'color', colord(1,:), 'linewidth', 5);
plot([pi, pi], [-2, 14.5], 'color', colord(1,:), 'linewidth', 5);
plot([-5*pi/4, -5*pi/4], [4, 5], 'color', 'k', 'linewidth', 2.5);
plot([-pi/4, -pi/4], [4, 5], 'color', 'k', 'linewidth', 2.5);
axis([-4.5, pi+4.5, -5, 17]); 
set(gca, 'XTick', {}, 'YTick', {}, 'visible', 'off');

fontsize = 25;
txt1 = 'Casimir plates';
txt2 = {'vacuum', 'fluctuations'};
txt3 = '\it{d}';
txt4 = '\lambda > \it{d}';
txt5 = '\lambda';
% txt6 = 'virtual \gamma';
text(-4, -5, txt1, 'fontsize', fontsize);
text(4, 15.8, txt2, 'fontsize', fontsize);
text(1.33, 15, txt3, 'fontsize', fontsize);
text(4, -2, txt4, 'fontsize', fontsize);
text(-2.5, 3, txt5, 'fontsize', fontsize);
% text(0.4, 3.8, txt6, 'fontsize', fontsize);

%% Phonon modes
close all;
x = linspace(0, pi, 100);
m1 = 7;
m2 = 10;
C = 100;
k = 0.1;
d = 1;
y1 = sqrt(C/(m1*m2)*(m1+ m2 + sqrt(m1^2 + m2^2 + 2*m1*m2*cos(x*d))));
y2 = sqrt(C/(m1*m2)*(m1+ m2 - sqrt(m1^2 + m2^2 + 2*m1*m2*cos(x*d))));
figure; hold all;
colord = get(gca, 'ColorOrder');
plot(x, y1, 'linewidth', 5);
plot(x, y2, 'linewidth', 5);
axis([0, pi, 0, 7]);
xlabel('$k$', 'interpreter', 'latex');
ylabel('$\omega(k)$', 'interpreter', 'latex');
set(gca, 'XTick', {}, 'YTick', {}, 'linewidth', 3, 'fontsize', 28);
txt1 = 'optical';
txt2 = 'acoustic';
txt3 = '\pi/d';
text(0.5, 6, txt1, 'fontsize', 28, 'color', colord(1,:));
text(0.5, 3, txt2, 'fontsize', 28, 'color', colord(2,:));
text(pi-0.2, -0.5, txt3, 'fontsize', 28);

%% Save figures
for i = 1
    print(figure(i), 'hermite', '-dpng', '-r300');
end