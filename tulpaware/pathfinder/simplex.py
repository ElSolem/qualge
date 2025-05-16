from noise import snoise2
import numpy as np
import matplotlib.pyplot as plt

width, height = 200, 200
scale = 0.1
octaves = 4

simplex = np.zeros((height, width))

for y in range(height):
    for x in range(width):
        nx, ny = x * scale, y * scale
        simplex[y][x] = snoise2(nx, ny, octaves=octaves)

# Normalize
simplex = (simplex - simplex.min()) / (simplex.max() - simplex.min())

plt.imshow(simplex, cmap='terrain')
plt.title("Simplex Noise")
plt.colorbar()
plt.show()
