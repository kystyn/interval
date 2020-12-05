import numpy as np
from matplotlib import pyplot as pl

def mid( n, eps ):
    A = np.zeros((n, n))

    for y in range(0, n):
        for x in range(0, n):
            A[y][x] = eps / 2
        A[y][y] = 1

    return A


def rad( n, eps ):
    A = np.zeros((n, n))

    for y in range(0, n):
        for x in range(0, n):
            A[y][x] = eps / 2
        A[y][y] = 0

    return A


#n = int(input('Input matrix size: '))

def evaluate( n ):
    l = 0
    r = 200

    accuracy = 1e-3

    while r - l > accuracy:
        eps = (l + r) / 2

        invA = np.abs(np.linalg.inv(mid(n, eps)))
        radA = rad(n, eps)
        rho = np.max(np.linalg.eigvals(invA.dot(radA)))

        # special, need low
        if rho > 1:
            r = eps
        # not-special, need up
        else:
            l = eps
    return eps


x = []
y = []
eps = 0
for n in range(2, 15):
    x.append(n)
    eps = evaluate(n)
    y.append(eps)
    print('bound epsilon is: ', eps)

pl.plot(x, y)
pl.title('Dependence of $\epsilon$ on matrix dimension')
pl.xlabel('n')
pl.ylabel('$\epsilon$')
pl.savefig('../figure/degenmat.png', format='png')
pl.show()
