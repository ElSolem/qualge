from PIL import Image
import numpy as np
import matplotlib.pyplot as plt

# Image resolution
width, height = 512, 512

# Frequency multipliers (these can be tuned)
a = 4.0
b = 3.0

# Coordinate grid
x = np.linspace(-np.pi, np.pi, width)
y = np.linspace(-np.pi, np.pi, height)
xx, yy = np.meshgrid(x, y)

# Pattern function: sin(xa + sin(yb)) - (sin(1.5x) * cos(1.5y))
pattern = np.sin(xx * a + np.sin(yy * b)) - (np.sin(1.5 * xx) * np.cos(1.5 * yy))

# Normalize to 0-255 grayscale
pattern_normalized = ((pattern - pattern.min()) / (pattern.max() - pattern.min()) * 255).astype(np.uint8)
image = Image.fromarray(pattern_normalized, mode='L')

# Show preview
plt.imshow(image, cmap='viridis')
plt.axis('off')
plt.title("Water Shader Pattern")
plt.show()

# Save result
image_rgb = image.convert("RGB")
image_rgb.save("tulpaware/pathfinder/water_shader_fractal_wave.png")
"tulpaware/pathfinder/water_shader_fractal_wave.png"
