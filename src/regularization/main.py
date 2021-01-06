import numpy as np
import scipy.optimize as opt
from tolsolvty import tolsolvty

A = np.loadtxt("A.txt")
inf_b = np.loadtxt("infb.txt").reshape(3, 1)
sup_b = np.loadtxt("supb.txt").reshape(3, 1)

print(A, inf_b, sup_b)

[tolmax, argmax, envs, ccode] = tolsolvty(A, A, inf_b, sup_b)

print("max Tol = ", tolmax)

diag_rad_b = np.diag(np.squeeze(np.asarray(0.5 * (sup_b - inf_b))))

C = np.block([[-A, -diag_rad_b],
              [A, -diag_rad_b]])

mid_b = 0.5 * (inf_b + sup_b)
r = np.concatenate([-mid_b, mid_b])
r = np.squeeze(np.asarray(r))

pos_sign = (0, None)
any_sign = (None, None)
res = opt.linprog([0, 0, 1, 1, 1],
                      A_ub=C,
                      b_ub=r,
                      bounds=[any_sign, any_sign,
                              pos_sign, pos_sign, pos_sign],
                      method='simplex')
print(res.x)

inf_b -= res.x[-3:].reshape(3, 1)
sup_b += res.x[-3:].reshape(3, 1)

[tolmax, argmax, envs, ccode] = tolsolvty(A, A, inf_b, sup_b)

print("max Tol = ", tolmax, "argmax = ", argmax)
