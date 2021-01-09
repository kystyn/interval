A = [[1, 2]; [-3, 4]];
b = [[0, 10]; [10, 20]];
xinf = [];
xsup = [];
[xinf, xsup] = exact(A, b(:, 1)', b(:, 2)')
A * ki(xinf', xsup')
ki(b(:, 1), b(:, 2))