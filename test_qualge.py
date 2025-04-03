import numpy as np
import matplotlib.pyplot as plt

# Function to calculate the slope between two opposite points
def calculate_slope(x, y):
    # Avoid division by zero
    if x == 0 or y == 0:
        return None  # Return None for undefined slope
    x2, y2 = -x, -y  # Opposite points
    slope = (y2 - y) / (x2 - x)  # Slope formula
    return slope

# Define the initial conditions for the different ranges
ranges = {
    "Positive Integers (1-100)": (1, 1, 1, 1, 100),
    "Negative Integers (-1 to -100)": (-1, -1, -1, -1, 100),
    "Small Decimals (0.1 to 0.001)": (0.1, 0.1, 0.01, 0.01, 100),
    "Negative Small Decimals (-0.1 to -0.001)": (-0.1, -0.1, -0.01, -0.01, 100),
}

# Process each range and calculate slopes
for label, (x0, y0, dx, dy, steps) in ranges.items():
    print(f"\n### Slopes for {label} ###")
    
    slopes = []
    for step in range(steps):
        slope = calculate_slope(x0, y0)
        if slope is not None:
            slopes.append(slope)
        
        # Update x, y positions
        x0 += dx
        y0 += dy
    
    # Print slopes for this range
    for i, slope in enumerate(slopes):
        print(f"Step {i}: Slope = {slope:.6f}" if slope is not None else f"Step {i}: Undefined Slope")

# Plot the slopes for visualization
plt.figure(figsize=(10, 6))

for label, (x0, y0, dx, dy, steps) in ranges.items():
    x_vals = []
    y_vals = []
    slopes = []
    
    for step in range(steps):
        slope = calculate_slope(x0, y0)
        if slope is not None:
            slopes.append(slope)
        
        x_vals.append(x0)
        y_vals.append(y0)
        
        # Update x, y positions
        x0 += dx
        y0 += dy
    
    # Plotting only if there are valid slopes
    if slopes:
        plt.plot(x_vals, slopes, label=label)

plt.xlabel("X-axis (Initial Points)")
plt.ylabel("Slope (y/x)")
plt.title("Slope Between Opposite Points (Four Variants)")
plt.legend()
plt.show()
