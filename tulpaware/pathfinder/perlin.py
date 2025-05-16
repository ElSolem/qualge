from noise import pnoise2
import numpy as np
import matplotlib.pyplot as plt

width, height = 200, 200
scale = 0.1
octaves = 4

perlin = np.zeros((height, width))

for y in range(height):
    for x in range(width):
        nx, ny = x * scale, y * scale
        perlin[y][x] = pnoise2(nx, ny, octaves=octaves)

# Normalize
perlin = (perlin - perlin.min()) / (perlin.max() - perlin.min())

plt.imshow(perlin, cmap='terrain')
plt.title("Perlin Noise")
plt.colorbar()
plt.show()
