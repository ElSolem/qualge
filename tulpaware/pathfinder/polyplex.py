
import numpy as np
import matplotlib.pyplot as plt

# Set up the grid
x = np.linspace(-10, 10, 1000)
y = np.linspace(-10, 10, 1000)
X, Y = np.meshgrid(x, y)

# Parameters
a = 1
b = -1

# First equation: sin(xa + sin(yb)) = sin(1.5x) * cos(1.5y)
Z1 = np.sin(a * X + np.sin(b * Y)) - (np.sin(1.5 * X) * np.cos(1.5 * Y))

# Plot the contour
plt.contour(X, Y, Z1, levels=[0], colors='blue')
plt.title("Polyplex Noise: sin(xa + sin(yb)) = sin(1.5x) * cos(1.5y)")
plt.xlabel("x")
plt.ylabel("y")
plt.gca().set_aspect('equal', adjustable='box')
plt.grid(True)
plt.show()
