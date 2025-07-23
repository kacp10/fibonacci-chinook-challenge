from typing import List

def fib_list(numbers: List[int]) -> List[int]:
    """
    Devuelve el término nésimo de Fibonacci para cada número del array.

    Complejidad: O(m · k)  —m = len(numbers), k = máximo n.
    Con k <= 30 la ejecución está por debajo de 0.5s.
    """
    def fib(n: int) -> int:
        a, b = 0, 1
        for _ in range(n):
            a, b = b, a + b
        return a
    return [fib(n) for n in numbers]
