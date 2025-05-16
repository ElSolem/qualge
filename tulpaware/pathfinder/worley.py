import numpy as np
import matplotlib.pyplot as plt

width, height = 200, 200
num_feature_points = 30  # more = smaller cells

# Generate random feature points
feature_points = np.random.rand(num_feature_points, 2) * [width, height]

worley = np.zeros((height, width))

for y in range(height):
    for x in range(width):
        min_dist = float('inf')
        for px, py in feature_points:
            dist = np.sqrt((x - px) ** 2 + (y - py) ** 2)
            if dist < min_dist:
                min_dist = dist
        worley[y][x] = min_dist

# Normalize
worley = (worley - worley.min()) / (worley.max() - worley.min())

plt.imshow(worley, cmap='terrain')
plt.title("Worley (Cellular) Noise")
plt.colorbar()
plt.show()
