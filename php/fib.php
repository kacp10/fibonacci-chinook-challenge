<?php
declare(strict_types=1);

/**
 * Devuelve la lista de Fibonacci para cada entrada.
 * Complejidad: O(m · k)  — m = cantidad de números, k = valor máximo; 
 * para k ≤ 30 es irrelevante (< 0.5 s).
 *
 * @param int[] $numbers
 * @return int[]
 */
function fibList(array $numbers): array {
    return array_map(function(int $n): int {
        $a = 0; $b = 1;
        for ($i = 0; $i < $n; $i++) {
            [$a, $b] = [$b, $a + $b];
        }
        return $a;
    }, $numbers);
}
