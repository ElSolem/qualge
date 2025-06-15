import math
import numpy as np
import time

start_time = time.time()
def quantum_condition(x, y):
    print("Checking fourdime condition for:", x, y)

    checks = [
        (x == 0, "x = 0"),
        (y == 0, "y = 0"),
        (x == x, "x = x"),
        (x == y, "x = y"),
        (y == y, "y = y"),
        (x*x == 0, "xx = 0"),
        (x*y == 0, "xy = 0"),
        (y*y == 0, "yy = 0"),
        (x*x == x, "xx = x"),
        (x*x == y, "xx = y"),
        (x*y == x, "xy = x"),
        (x*y == y, "xy = y"),
        (x*x == x*x, "xx = xx"),
        (x*x == x*y, "xx = xy"),
        (x*x == y*y, "xx = yy"),
        (x*y == x*y, "xy = xy"),
        (x*y == y*y, "xy = yy"),
        (y*y == y*y, "yy = yy"),
        (x*x == x/y, "xx = x/y"),
        (x*y == x/y, "xy = x/y"),
        (y*y == x/y, "yy = x/y"),
    ]

    result = False
    for cond, msg in checks:
        if cond:
            print(msg)
            result = True

    if result:
        print("the end")
        return True

    try:
        val1 = math.tan(11111.0 * x * 11111.0 * y)
        val2 = math.tan((11111.0 * x) / (11111.0 * y))
        return abs(val1 - val2) < 1e-5
    except:
        return False

for i in range(1, 11):
    for j in range(1, 10000):
        print(quantum_condition(i, j))

end_time = time.time()
print(f"Time taken: {end_time - start_time} seconds")
print("Doctor Who?! DOCTOR & WHOM!!")