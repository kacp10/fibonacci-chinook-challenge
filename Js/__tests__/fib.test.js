const { fibList } = require('../fib');

test('fibList básico', () => {
  expect(fibList([0,1,2,3,10,30])).toEqual([0,1,1,2,55,832040]);
});
