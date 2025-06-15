import numpy as np
import matplotlib.pyplot as plt

# Define the evolving function
def evolve(x, y, dx=0.1, dy=0.1, steps=100):
    values = [(x, y)]  # Store evolution

    for _ in range(steps):
        dx_new = y / (x + 1e-8)  # Prevent division by zero
        dy_new = x / (y + 1e-8)

        x += dx * dx_new
        y += dy * dy_new
        
        values.append((x, y))  # Track evolution

    return np.array(values)

# Define different initial conditions for the four cases
ranges = {
    "Positive Integers (1-100)": (1, 1, 1, 1, 100),
    "Negative Integers (-1 to -100)": (-1, -1, 1, 1, 100),
    "Small Decimals (0.1 to 0.001)": (0.1, 0.1, 0.01, 0.01, 100),
    "Negative Small Decimals (-0.1 to -0.001)": (-0.1, -0.1, 0.01, 0.01, 100),
}

# Process each range and print results
for label, (x0, y0, dx, dy, steps) in ranges.items():
    print(f"\n### Evolution for {label} ###")
    evolution = evolve(x0, y0, dx, dy, steps)
    
    for i, (x, y) in enumerate(evolution):
        print(f"Step {i}: X = {x:.6f}, Y = {y:.6f}")

# Plot all versions
plt.figure(figsize=(10, 6))

for label, (x0, y0, dx, dy, steps) in ranges.items():
    evolution = evolve(x0, y0, dx, dy, steps)
    plt.plot(evolution[:, 0], evolution[:, 1], marker="o", linestyle="-", label=label)

plt.xlabel("X-axis")
plt.ylabel("Y-axis")
plt.title("Self-Evolving fourdime Differential System (Four Variants)")
plt.legend()
plt.show()
