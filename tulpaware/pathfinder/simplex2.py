import noise
import numpy as np
import matplotlib.pyplot as plt

# Map settings
width, height = 100, 100
scale = 0.1  # Controls zoom of noise
octaves = 4  # Detail level
persistence = 0.5
lacunarity = 2.0

# Seed value for consistency
seed = np.random.randint(0, 100)

def generate_map():
    map_data = np.zeros((height, width))

    for y in range(height):
        for x in range(width):
            nx = x * scale
            ny = y * scale
            value = noise.snoise2(
                nx, ny,
                octaves=octaves,
                persistence=persistence,
                lacunarity=lacunarity,
                repeatx=1024,
                repeaty=1024,
                base=seed
            )
            # Normalize value from [-1, 1] to [0, 1]
            map_data[y][x] = (value + 1) / 2

    return map_data

# Display as grayscale map
map_data = generate_map()
plt.imshow(map_data, cmap='terrain')
plt.title("Procedural Map using Simplex Noise")
plt.colorbar()
plt.show()
