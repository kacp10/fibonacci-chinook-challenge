/**
 * Devuelve un array con el n‑ésimo término de Fibonacci
 * para cada elemento de entrada.
 *
 * Complejidad: O(m · k) — m = numbers.length, k = mayor n;
 * con k ≤ 30 el tiempo está muy por debajo de 0.5 s.
 */
// Js/fib.js
function fibList(numbers) {
  return numbers.map(n => {
    let a = 0, b = 1;
    for (let i = 0; i < n; i++) [a, b] = [b, a + b];
    return a;
  });
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = { fibList };
}
export { fibList };
