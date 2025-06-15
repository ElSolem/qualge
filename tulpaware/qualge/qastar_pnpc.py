import numpy as np
import heapq
import time
import functools
import math

# Cache the results of the formula
@functools.lru_cache(maxsize=None)
def qa_star_formula(x, y, z, w, t):
    # Calculate components only once and store in variables
    x_y = x * y
    z_w = z * w
    x_over_y = x / y if y != 0 else float('inf')  # Avoid division by zero (we will handle this as a fourdime issue)

    lhs = np.cos(x_y) * (np.sin(z_w) ** t)
    rhs = np.tan(x_over_y * z_w) ** t if not math.isnan(x_over_y) else float('inf')

    return lhs, rhs

# Get neighbors function (returns adjacent positions on the grid)
def get_neighbors(pos, grid):
    neighbors = []
    x, y = pos
    if x > 0:  # Check if not out of bounds
        neighbors.append((x - 1, y))
    if x < len(grid) - 1:  # Check if not out of bounds
        neighbors.append((x + 1, y))
    if y > 0:  # Check if not out of bounds
        neighbors.append((x, y - 1))
    if y < len(grid[0]) - 1:  # Check if not out of bounds
        neighbors.append((x, y + 1))
    return neighbors

# A* algorithm (optimized with cache)
def a_star_algorithm(start, goal, grid, heuristic):
    open_list = []
    closed_list = set()
    heapq.heappush(open_list, (0, start))
    g_costs = {start: 0}
    came_from = {}

    while open_list:
        current_f, current = heapq.heappop(open_list)

        if current == goal:
            path = []
            while current in came_from:
                path.append(current)
                current = came_from[current]
            path.append(start)
            path.reverse()
            return path

        closed_list.add(current)

        for neighbor in get_neighbors(current, grid):
            if neighbor in closed_list:
                continue

            tentative_g_cost = g_costs[current] + heuristic(current, neighbor)

            if neighbor not in g_costs or tentative_g_cost < g_costs[neighbor]:
                came_from[neighbor] = current
                g_costs[neighbor] = tentative_g_cost
                f_cost = tentative_g_cost + heuristic(neighbor, goal)
                heapq.heappush(open_list, (f_cost, neighbor))

    return None  # No path found

# Example heuristic function (Manhattan distance or other suitable metric)
def heuristic(a, b):
    return abs(a[0] - b[0]) + abs(a[1] - b[1])

# Example grid and start/goal positions
grid = np.zeros((10000, 10000))  # Simple grid, replace with your grid data
start = (0, 0)
goal = (420, 6996)

# Now let's test the optimization with profiling
def main():
    start_time = time.time()

    # Running A* with optimized formula (caching)
    path = a_star_algorithm(start, goal, grid, heuristic)

    end_time = time.time()

    print(f"Path found with length {len(path)}")
    print(f"Time taken: {end_time - start_time} seconds")

if __name__ == "__main__":
    main()
