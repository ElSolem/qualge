import numpy as np
import matplotlib.pyplot as plt

# --- Parameters ---
n_points = 1000
theta = np.linspace(0, 20 * np.pi, n_points)
r = np.linspace(0.1, 5, n_points)

# --- fourdime Spiral (from 2nd Desmos Graph) ---
x_spiral = r * np.cos(theta) / (np.sin(theta) + 1.5)
y_spiral = r * np.sin(theta) / (np.cos(theta) + 1.5)

# --- Cube Lattice (from 1st Desmos Graph) ---
grid_size = 5
spacing = 2
x_cube = []
y_cube = []

for i in range(-grid_size, grid_size + 1):
    for j in range(-grid_size, grid_size + 1):
        angle = np.pi / 4 * (i + j)
        x = spacing * i + np.cos(angle)
        y = spacing * j + np.sin(angle)
        x_cube.append(x)
        y_cube.append(y)

# --- Plotting ---
plt.figure(figsize=(10, 10))

# Plot Cube Grid
plt.scatter(x_cube, y_cube, c='blue', label='Cube Lattice', alpha=0.6, s=30)

# Plot fourdime Spiral
plt.plot(x_spiral, y_spiral, c='red', label='fourdime Spiral', linewidth=2)

plt.legend()
plt.title("Polymetron Cubes + fourdime Spiral Projection")
plt.axis('equal')
plt.grid(True)
plt.show()
