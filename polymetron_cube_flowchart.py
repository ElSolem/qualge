import matplotlib.pyplot as plt
import numpy as np

# Define grid
x = np.linspace(-10, 10, 400)
y = np.linspace(-10, 10, 400)
x, y = np.meshgrid(x, y)

# Create a colored static version using inverse grid + directional gradient + Thrones

# Inverse checkerboard base
z_colored = 1 - ((np.abs(np.mod(x, 2) - 1) < 0.2) & (np.abs(np.mod(y, 2) - 1) < 0.2)).astype(float)

# Directional gradient (Chaos to Order)
flow_gradient = (x + 10) / 20  # normalized from 0 to 1
z_colored *= flow_gradient

# Thrones mask (center cross)
throne_mask = (
    ((np.abs(x) < 0.5) & (np.abs(np.mod(y, 2) - 1) < 0.2)) |
    ((np.abs(y) < 0.5) & (np.abs(np.mod(x, 2) - 1) < 0.2))
)
z_colored[throne_mask] = 1.0  # full brightness for thrones

# Plot colored version
fig_colored, ax_colored = plt.subplots(figsize=(8, 8))
cmap_colored = plt.cm.magma
ax_colored.imshow(z_colored, extent=(-10, 10, -10, 10), origin='lower', cmap=cmap_colored)
ax_colored.set_title("Polymetron Inverse Grid with Flow & Living Thrones")
ax_colored.set_xlabel("X (Chaos → Order)")
ax_colored.set_ylabel("Y")

plt.tight_layout()
plt.show()
