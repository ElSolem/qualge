import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import sympy as sp

# Define symbolic variables
x, y, z = sp.symbols('x y z')
i = sp.I  # Imaginary unit

# Define your equation
lhs = sp.sin(x * y) * z * i**2
rhs = sp.cos(x / y) / (z * i**2)

# Extract real and imaginary parts
lhs_real, lhs_imag = sp.re(lhs), sp.im(lhs)
rhs_real, rhs_imag = sp.re(rhs), sp.im(rhs)

# Convert to numerical functions
lhs_real_func = sp.lambdify((x, y, z), lhs_real, "numpy")
lhs_imag_func = sp.lambdify((x, y, z), lhs_imag, "numpy")
rhs_real_func = sp.lambdify((x, y, z), rhs_real, "numpy")
rhs_imag_func = sp.lambdify((x, y, z), rhs_imag, "numpy")

# Create meshgrid for plotting
X = np.linspace(-5, 5, 100)
Y = np.linspace(-5, 5, 100)
Z = np.linspace(-5, 5, 100)
X, Y = np.meshgrid(X, Y)

# Evaluate the real part numerically
Z_real_lhs = lhs_real_func(X, Y, 1)  # Fix z=1 for visualization
Z_real_rhs = rhs_real_func(X, Y, 1)

# Plot the 3D surface
fig = plt.figure(figsize=(12, 6))
ax = fig.add_subplot(111, projection='3d')

# LHS plot
ax.plot_surface(X, Y, Z_real_lhs, cmap='viridis', alpha=0.7, edgecolor='k')

# RHS plot
ax.plot_surface(X, Y, Z_real_rhs, cmap='plasma', alpha=0.7, edgecolor='k')

# Labels
ax.set_xlabel('X')
ax.set_ylabel('Y')
ax.set_zlabel('Z (Real Part)')
ax.set_title('Plot of sin(XY)zi² = cos(X/Y)/(zi²)')

plt.show()

