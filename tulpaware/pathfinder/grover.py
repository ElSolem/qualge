from qiskit import QuantumCircuit
from qiskit_algorithms import Grover
from qiskit_algorithms.algorithms.grover_problem import GroverProblem
from qiskit.primitives import Sampler
from qiskit.quantum_info import Statevector
from qiskit.circuit.library import PhaseOracle

# Define the Boolean function as a logic string (here: find input 11)
oracle = PhaseOracle("a & b")

# Wrap the oracle in a GroverProblem
problem = GroverProblem(oracle)

# Run Grover's algorithm
grover = Grover(sampler=Sampler())
result = grover.solve(problem)

# Output the result
print("Grover's search result:")
print(result)
