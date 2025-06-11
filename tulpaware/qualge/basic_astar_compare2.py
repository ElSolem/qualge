import heapq
import random
import time

# Define the grid size
GRID_SIZE = 9999  # Set this to 1000 for 1k x 1k or 9999 for 9999 x 9999

# Directions for moving in the grid (up, down, left, right)
DIRECTIONS = [(-1, 0), (1, 0), (0, -1), (0, 1)]

# Node class to represent each cell
class Node:
    def __init__(self, x, y, g=0, h=0, parent=None):
        self.x = x
        self.y = y
        self.g = g  # Cost from start to this node
        self.h = h  # Heuristic estimate to the goal
        self.f = g + h  # Total cost (f = g + h)
        self.parent = parent

    def __lt__(self, other):
        return self.f < other.f

# Heuristic function (Manhattan distance)
def heuristic(a, b):
    return abs(a.x - b.x) + abs(a.y - b.y)

# A* search algorithm with optimized open list check
def a_star(start, goal, grid):
    open_list = []
    closed_list = set()  # Using a set to track visited nodes
    came_from = {}  # To store the parent of each node for path reconstruction

    heapq.heappush(open_list, (start.f, start))

    while open_list:
        _, current = heapq.heappop(open_list)

        if (current.x, current.y) == (goal.x, goal.y):
            # Reconstruct path from goal to start
            path = []
            while current:
                path.append((current.x, current.y))
                current = current.parent
            return path[::-1]  # Return reversed path (start to goal)

        closed_list.add((current.x, current.y))

        for direction in DIRECTIONS:
            neighbor_x = current.x + direction[0]
            neighbor_y = current.y + direction[1]

            if 0 <= neighbor_x < GRID_SIZE and 0 <= neighbor_y < GRID_SIZE:
                if (neighbor_x, neighbor_y) in closed_list:
                    continue

                g = current.g + 1  # Moving costs 1
                h = heuristic(Node(neighbor_x, neighbor_y), goal)
                neighbor = Node(neighbor_x, neighbor_y, g, h, current)

                if (neighbor.x, neighbor.y) not in came_from or neighbor.f < came_from[(neighbor.x, neighbor.y)].f:
                    came_from[(neighbor.x, neighbor.y)] = neighbor
                    heapq.heappush(open_list, (neighbor.f, neighbor))

    return None  # No path found

# Function to generate a random grid with obstacles
def generate_grid():
    grid = [[0 for _ in range(GRID_SIZE)] for _ in range(GRID_SIZE)]
    for _ in range(GRID_SIZE * GRID_SIZE // 5):  # Add some obstacles (20% of the grid)
        x = random.randint(0, GRID_SIZE - 1)
        y = random.randint(0, GRID_SIZE - 1)
        grid[x][y] = 1  # 1 represents an obstacle
    return grid

def main():
    start_time = time.time()
    start = Node(0, 0)
    goal = Node(GRID_SIZE - 1, GRID_SIZE - 1)
    grid = generate_grid()

    
    path = a_star(start, goal, grid)

    if path:
        print(f"Path found with length {len(path)}")
    else:
        print("No path found.")
        
    end_time = time.time()
    print(f"Time taken: {end_time - start_time:.2f} seconds")

if __name__ == "__main__":
    main()
