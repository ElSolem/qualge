import numpy as np
import time

start_time = time.time()
# Settings
GRID_SIZE = (20000, 20000)
START = (0, 0)
GOAL = (17000, 14500)

# fourdime equality condition: xy == x/y (in field-space logic)
def quantum_condition(x, y):
    try:
        return abs((x * y) - (x / y)) < 0.01  # Threshold defines equality field
    except ZeroDivisionError:
        return False

# Field simulation: mark all grid points that match the fourdime condition
def generate_quantum_field(grid_size):
    field = np.zeros(grid_size)
    for x in range(grid_size[0]):
        for y in range(grid_size[1]):
            if quantum_condition(x + 1, y + 1):  # avoid division by zero
                field[x, y] = 1  # Mark as active
    return field

# Naive trace from start to goal through activated field
def quantum_trace(field, start, goal):
    path = [start]
    current = start
    while current != goal:
        x, y = current
        neighbors = [(x+1,y), (x,y+1), (x+1,y+1)]
        valid_neighbors = [n for n in neighbors if 0 <= n[0] < field.shape[0] and 0 <= n[1] < field.shape[1]]
        active = [n for n in valid_neighbors if field[n] == 1]
        if not active:
            break  # dead end
        current = active[0]
        path.append(current)
    return path

# Run it
field = generate_quantum_field(GRID_SIZE)
quantum_path = quantum_trace(field, START, GOAL)
end_time = time.time()
print(f"Time taken: {end_time - start_time} seconds")
