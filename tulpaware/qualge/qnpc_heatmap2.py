import numpy as np
import matplotlib.pyplot as plt

# Grid size
GRID_SIZE = 100

# Movement cost function using the original equation
def movement_cost(x, y, z, w, t):
    return np.cos(x * y) * (np.sin(z * w) ** t) / (np.tan((x / y) * (z * w)) ** t)

# Generate the heatmap grid
heatmap = np.zeros((GRID_SIZE, GRID_SIZE))
for x in range(1, GRID_SIZE):
    for y in range(1, GRID_SIZE):
        z = x + y  # Diagonal movement
        w = x - y  # Opposite diagonal
        t = np.sqrt(x**2 + y**2)  # Time component based on distance
        heatmap[x, y] = movement_cost(x, y, z, w, t)

# Plot heatmap
plt.imshow(heatmap, cmap='hot', interpolation='nearest')
plt.colorbar()
plt.title("QA* Heatmap - Original Formula")
plt.show()
