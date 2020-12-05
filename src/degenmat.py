import numpy as np

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


n = int(input('Input matrix size: '))

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


print('bound epsilon is: ', eps)

