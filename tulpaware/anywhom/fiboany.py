def next_fibo_above(n):
    a, b = 0, 1
    while b <= n:
        a, b = b, a + b
    return b

def fibonacci_divergence_trace(start_val):
    current = start_val
    steps = []

    visited = set()
    max_steps = 1000  # hard cap to prevent infinite loop

    for _ in range(max_steps):
        if current in visited or current == 0:
            break
        visited.add(current)

        next_fibo = next_fibo_above(current)
        diff = next_fibo - current
        steps.append((current, next_fibo, diff))
        current = diff

    return steps

# Example usage
start_value = 140733713820432 # or whatever pointer-ish value you have
trace = fibonacci_divergence_trace(start_value)

for curr, fibo, diff in trace:
    print(f"{curr} -> nearest_fibo: {fibo}, diff: {diff}")

for step in trace:
    print(f"From {step[0]} → Δ = {step[1]}")