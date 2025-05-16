
import numpy as np
import matplotlib.pyplot as plt

# Set up the grid
x = np.linspace(-10, 10, 1000)
y = np.linspace(-10, 10, 1000)
X, Y = np.meshgrid(x, y)

# Parameters
a = .65
b = -.45

# Second equation: sin((xa + sin(yb)) - sin(1.5x) * cos(1.5y)) = 0
Z2 = np.sin((a * X + np.sin(b * Y)) - np.sin(1.5 * X) * np.cos(1.5 * Y))

# Plot the contour
plt.contour(X, Y, Z2, levels=[0], colors='green')
plt.title("Polyplex Noise: sin((xa + sin(yb)) - sin(1.5x) * cos(1.5y)) = 0")
plt.xlabel("x")
plt.ylabel("y")
plt.gca().set_aspect('equal', adjustable='box')
plt.grid(True)
plt.show()
