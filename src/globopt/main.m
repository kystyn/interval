X = infsup([infsup(-5, 5), infsup(-5, 5)]);

%%%%% Rasstrigin function
[Z_r, WorkList_r, diams_r] = globopt0(@rastrigin, X);
iter = 1:1:length(diams_r);

figure;
plt = plot(iter, diams_r);
xlim([0, length(diams_r)]);
xlabel('Iteration number');
ylabel('Area diameter');
title('Rastrigin. Interval constriction');
saveas(plt, 'rastrigin_contr', 'png'); 

% minimizing sequence
truesol = -2;
minim_seq = zeros(1, length(WorkList_r));
for i = 1 : length(WorkList_r)
    minim_seq(i) = WorkList_r(i).Estim;
end

dist = zeros(1, length(minim_seq));
for i = 1 : length(minim_seq)
    dist(i) = abs(minim_seq(i) - truesol);
end

figure;
iter = 1:1:length(dist);
plt2 = semilogy(iter, dist);
xlim([0, length(dist)]);
xlabel('Iteration number');
ylabel('Solution distance');
title('Ratrigin convergence');
saveas(plt2, 'rastrigin_conv', 'png'); 

centers_x = [];
centers_y = [];
for i = 1 : length(WorkList_r)
    centers_x(i) = WorkList_r(i).Box(1).mid;
    centers_y(i) = WorkList_r(i).Box(2).mid;
end

figure;
plt3 = plot(centers_x, centers_y);
xlabel('x_c');
ylabel('y_c');
title('Rastrigin: Centers trajectory');
saveas(plt3, 'rastrigin_traj', 'png'); 

%%%%% Booth function
X = infsup([infsup(-10, 10), infsup(-10, 10)]);
[Z_b, WorkList_b, diams_b] = globopt0(@booth, X);
truesol = 0;

% minimizing sequence
minim_seq = zeros(1, length(WorkList_b));
for i = 1 : length(WorkList_b)
    minim_seq(i) = WorkList_b(i).Estim;
end

dist = zeros(1, length(minim_seq));
for i = 1 : length(minim_seq)
    dist(i) = abs(minim_seq(i) - truesol);
end

figure;
iter = 1:1:length(dist);
plt1 = semilogy(iter, dist);
xlim([0, length(dist)]);
xlabel('Iteration number');
ylabel('Solution distance');
title('Booth convergence');
saveas(plt1, 'booth', 'png'); 

centers_x = [];
centers_y = [];
for i = 1 : length(WorkList_b)
    centers_x(i) = WorkList_b(i).Box(1).mid;
    centers_y(i) = WorkList_b(i).Box(2).mid;
end

xlist = [-10 : 0.1 : 10];
ylist = [-10 : 0.1 : 10];

[X, Y] = meshgrid(xlist, ylist);
Z = booth2(X, Y);

f4 = figure;
contour(X, Y, Z, 30);
hold on;

plot(centers_x, centers_y);

xlabel('x_c');
ylabel('y_c');
title('Booth: Centers trajectory');
saveas(f4, 'booth_traj', 'png'); 