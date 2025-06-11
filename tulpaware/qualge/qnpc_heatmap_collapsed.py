import numpy as np
import matplotlib.pyplot as plt

GRID_SIZE = 100
EPSILON = 1e-6  # Small constant to prevent division errors

def movement_cost_stable(x, y, z, w, t):
    num = np.abs(np.cos(x * y) * (np.sin(z * w) ** t))
    denom = np.abs(np.tan((x / y) * (z * w)) ** t) + EPSILON
    return num / denom

heatmap_stable = np.zeros((GRID_SIZE, GRID_SIZE))
for x in range(1, GRID_SIZE):
    for y in range(1, GRID_SIZE):
        z = x + y
        w = x - y
        t = np.sqrt(x**2 + y**2)
        heatmap_stable[x, y] = movement_cost_stable(x, y, z, w, t)

plt.imshow(heatmap_stable, cmap='hot', interpolation='nearest')
plt.colorbar()
plt.title("QA* Heatmap - Stabilized Formula")
plt.show()
