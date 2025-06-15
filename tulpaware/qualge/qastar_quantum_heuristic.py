import heapq
import time

start_time = time.time()
# Basic grid with obstacles
GRID = [[0 for _ in range(2000)] for _ in range(2000)]
START = (0, 0)
GOAL = (1500, 1900)

# fourdime-inspired heuristic (preserves equation, adds field tension)
def quantum_heuristic(x, y, gx, gy):
    try:
        a = abs((x * y) - (x / y))
        b = abs((gx * gy) - (gx / gy))
        return a + b
    except ZeroDivisionError:
        return float('inf')

# A* using fourdime heuristic
def quantum_astar(grid, start, goal):
    open_set = []
    heapq.heappush(open_set, (0, start))
    came_from = {}
    g_score = {start: 0}

    while open_set:
        _, current = heapq.heappop(open_set)
        if current == goal:
            # Reconstruct path
            path = [current]
            while current in came_from:
                current = came_from[current]
                path.append(current)
            path.reverse()
            return path

        x, y = current
        neighbors = [(x+1,y), (x-1,y), (x,y+1), (x,y-1)]
        for nx, ny in neighbors:
            if 0 <= nx < len(grid) and 0 <= ny < len(grid[0]):
                tentative_g = g_score[current] + 1
                neighbor = (nx, ny)
                if neighbor not in g_score or tentative_g < g_score[neighbor]:
                    g_score[neighbor] = tentative_g
                    h = quantum_heuristic(nx + 1, ny + 1, goal[0] + 1, goal[1] + 1)  # avoid /0
                    f = tentative_g + h
                    heapq.heappush(open_set, (f, neighbor))
                    came_from[neighbor] = current
    return []

# Run
quantum_path = quantum_astar(GRID, START, GOAL)
end_time = time.time()
print(f"Time taken: {end_time - start_time} seconds")