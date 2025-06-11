import heapq
import sys
import time

class Node:
    def __init__(self, x, y, parent=None):
        self.x = x
        self.y = y
        self.parent = parent
        self.g = 0  # Cost from start to current node
        self.h = 0  # Heuristic: cost to goal
        self.f = 0  # Total cost (g + h)

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __hash__(self):
        return hash((self.x, self.y))

    def __lt__(self, other):
        return self.f < other.f  # Compare based on total cost for heapq

def heuristic(node, goal):
    return abs(node.x - goal.x) + abs(node.y - goal.y)  # Manhattan distance

def a_star(start, goal, grid_size):
    open_list = []
    closed_set = set()

    start.h = heuristic(start, goal)
    start.f = start.h

    heapq.heappush(open_list, (start.f, start))
    
    while open_list:
        _, current = heapq.heappop(open_list)

        if current == goal:
            path = []
            while current:
                path.append((current.x, current.y))
                current = current.parent
            return path[::-1]  # Return reversed path

        closed_set.add(current)

        for dx, dy in [(-1,0), (1,0), (0,-1), (0,1)]:  # 4-way movement
            x, y = current.x + dx, current.y + dy

            if 0 <= x < grid_size and 0 <= y < grid_size:  # Stay in bounds
                neighbor = Node(x, y, current)
                if neighbor in closed_set:
                    continue

                neighbor.g = current.g + 1
                neighbor.h = heuristic(neighbor, goal)
                neighbor.f = neighbor.g + neighbor.h

                heapq.heappush(open_list, (neighbor.f, neighbor))

    return None  # No path found

# === Max Limit Testing ===
if __name__ == "__main__":
    sys.setrecursionlimit(10**6)  # Increase recursion limit
    max_grid_size = 10**5  # Adjust this value manually if needed

    start_time = time.time()

    try:
        print(f"Testing A* with grid size: {max_grid_size} x {max_grid_size}")
        start = Node(0, 0)
        goal = Node(max_grid_size - 1, max_grid_size - 1)
        path = a_star(start, goal, max_grid_size)

        if path:
            print(f"Path found with {len(path)} steps.")
        else:
            print("No path found.")

    except MemoryError:
        print("MemoryError: Grid size exceeded Python's handling capacity.")
