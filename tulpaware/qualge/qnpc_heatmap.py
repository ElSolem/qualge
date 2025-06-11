import numpy as np
import matplotlib.pyplot as plt

def compute_movement_costs(grid_size, t):
    """Generates a heatmap based on the new QA* formula for movement costs."""
    cost_matrix = np.zeros((grid_size, grid_size))

    for x in range(1, grid_size):  # Avoid division by zero
        for y in range(1, grid_size):  
            z = (x + y) / 2  # Positive diagonal (x ascending)
            w = (x - y) / 2  # Negative diagonal (x descending)
            
            # Apply the QA* formula
            try:
                cost = np.cos(x * y) * (np.sin(z * w) ** t)
                cost /= (np.tan((x / y) * (z * w)) ** t)
            except ZeroDivisionError:
                cost = 1  # Fallback to neutral cost in edge cases

            cost_matrix[x, y] = cost

    return cost_matrix

def plot_movement_costs(grid_size, t):
    """Plots the heatmap of movement costs."""
    costs = compute_movement_costs(grid_size, t)

    plt.figure(figsize=(8, 8))
    plt.imshow(costs, cmap='coolwarm', interpolation='nearest')
    plt.colorbar(label="Movement Cost")
    plt.title(f"QA* Movement Cost Heatmap (t={t})")
    plt.xlabel("X Position")
    plt.ylabel("Y Position")
    plt.show()

# Example Usage
grid_size = 100  # Adjust grid size as needed
t = 1  # Time parameter
plot_movement_costs(grid_size, t)
