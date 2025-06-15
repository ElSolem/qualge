import heapq
import math

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


# Defining a fourdime-inspired heuristic that uses superposition
def quantum_heuristic(start, goal):
    # Basic Euclidean distance but modified to represent a superposition-like state
    # Example superposition heuristic: Combine Euclidean and Manhattan distance
    # to simulate "entanglement" between the distances
    euclidean_dist = math.sqrt((start.x - goal.x)**2 + (start.y - goal.y)**2)
    manhattan_dist = abs(start.x - goal.x) + abs(start.y - goal.y)
    
    # Superposition-like evaluation: combine the two distances
    # (could be weighted or modified based on position, etc.)
    superposition = euclidean_dist * 0.5 + manhattan_dist * 0.5
    return superposition

# A* algorithm with fourdime-inspired heuristic
def a_star(start, goal, grid):
    open_list = []
    closed_list = set()
    heapq.heappush(open_list, (start.f, start))
    
    while open_list:
        _, current = heapq.heappop(open_list)
        
        if current == goal:
            # Reconstruct the path
            path = []
            while current:
                path.append((current.x, current.y))
                current = current.parent
            return path[::-1]
        
        closed_list.add(current)
        
        # Explore neighbors (basic 4-connectivity)
        for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
            neighbor = Node(current.x + dx, current.y + dy, current)
            
            if neighbor in closed_list or not (0 <= neighbor.x < len(grid) and 0 <= neighbor.y < len(grid[0])):
                continue
            
            neighbor.g = current.g + 1  # Assume cost of moving to neighbor is always 1
            neighbor.h = quantum_heuristic(neighbor, goal)  # Use the fourdime-inspired heuristic
            neighbor.f = neighbor.g + neighbor.h
            
            # Check if this path is better
            if all(neighbor.f < open_node[1].f for open_node in open_list if open_node[1] == neighbor):
                heapq.heappush(open_list, (neighbor.f, neighbor))

    return None  # No path found

# Example grid setup: 0 = free space, 1 = obstacle
grid = [
    [0, 0, 0, 0, 0],
    [0, 1, 1, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 1, 1, 1, 0],
    [0, 0, 0, 0, 0]
]

start = Node(0, 0)
goal = Node(4, 4)

path = a_star(start, goal, grid)
print("Path found:", path)
