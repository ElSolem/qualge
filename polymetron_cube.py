import matplotlib.pyplot as plt
import numpy as np

# Define grid
x = np.linspace(-10, 10, 400)
y = np.linspace(-10, 10, 400)
x, y = np.meshgrid(x, y)

# Inverse version: highlight non-active checkerboard regions
z_inverse = 1 - ((np.abs(np.mod(x, 2) - 1) < 0.2) & (np.abs(np.mod(y, 2) - 1) < 0.2)).astype(float)

# Create 2D inverse plot
fig2d_inv, ax2d_inv = plt.subplots(figsize=(8, 8))
ax2d_inv.imshow(z_inverse, extent=(-10, 10, -10, 10), origin='lower', cmap=plt.cm.binary)
ax2d_inv.set_title("Polymetron Cubes - Inverse 2D Grid")
ax2d_inv.set_xlabel("X")
ax2d_inv.set_ylabel("Y")

# Create 3D inverse plot
from mpl_toolkits.mplot3d import Axes3D

fig3d_inv = plt.figure(figsize=(10, 8))
ax3d_inv = fig3d_inv.add_subplot(111, projection='3d')

# Generate 3D heights using inverse cube values
z3d_inv = z_inverse * np.sin(x * 0.5) * np.cos(y * 0.5)

# Plot surface
ax3d_inv.plot_surface(x, y, z3d_inv, cmap='inferno', edgecolor='k', linewidth=0.05)
ax3d_inv.set_title("Polymetron Cubes - Inverse 3D Projection")
ax3d_inv.set_xlabel("X")
ax3d_inv.set_ylabel("Y")
ax3d_inv.set_zlabel("Z (inverse symbolic amplitude)")

plt.tight_layout()
plt.show()

