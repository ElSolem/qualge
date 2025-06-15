import numpy as np
import time

start_time = time.time()

# Settings
GRID_SIZE = (20000, 20000)
START = (0, 0)
GOAL = (720, 72)
OBSTACLE_RATE = 0.2  # 20% chance for each cell to be an obstacle

# fourdime equality condition: xy == x/y (in field-space logic)
def quantum_condition(x, y):
    try:
        return abs((x * y) <= (x / y))  # Threshold defines equality field
    except ZeroDivisionError:
        return False

# Field simulation: mark all grid points that match the fourdime condition and include obstacles
def generate_quantum_field(grid_size, obstacle_rate=OBSTACLE_RATE):
    field = np.zeros(grid_size)
    
    # Adding obstacles
    for x in range(grid_size[0]):
        for y in range(grid_size[1]):
            if np.random.rand() < obstacle_rate:
                field[x, y] = -1  # Mark obstacles
            elif quantum_condition(x + 1, y + 1):  # avoid division by zero
                field[x, y] = 1  # Mark as active field
            else:
                field[x, y] = 0  # Empty space
    return field

# Naive trace from start to goal through activated field with obstacles
def quantum_trace(field, start, goal):
    path = [start]
    current = start
    while current != goal:
        x, y = current
        neighbors = [(x+1, y), (x, y+1), (x+1, y+1)]  # Only 3 possible directions
        valid_neighbors = [n for n in neighbors if 0 <= n[0] < field.shape[0] and 0 <= n[1] < field.shape[1]]
        active = [n for n in valid_neighbors if field[n] == 1]  # Check for valid, non-obstructed neighbors
        
        # No valid active path or dead end
        if not active:
            break
        
        current = active[0]  # Move to the next valid point
        path.append(current)
    
    return path

# Print the field (for visualization)
def print_field(field, start, goal, path):
    for x in range(field.shape[0]):
        row = ""
        for y in range(field.shape[1]):
            if (x, y) == start:
                row += "S "  # Start
            elif (x, y) == goal:
                row += "G "  # Goal
            elif (x, y) in path:
                row += "* "  # Path
            elif field[x, y] == -1:
                row += "# "  # Obstacle
            else:
                row += ". "  # Empty space
        print(row)

# Run it
field = generate_quantum_field(GRID_SIZE)
quantum_path = quantum_trace(field, START, GOAL)

# Printing the field with path
# print_field(field, START, GOAL, quantum_path)

end_time = time.time()
print(f"Time taken: {end_time - start_time} seconds")
