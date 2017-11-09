import * as R from 'ramda';

const isEven = R.pipe(R.modulo(R.__, 2), R.equals(0));

function solve(
    maxValue: number,
    acc: number = 0,
    [x, y]: [number, number] = [0, 1]
): number {
    if (x > maxValue) { return acc; }

    return isEven(x) ?
        solve(maxValue, acc + x, [y, x + y]) :
        solve(maxValue, acc, [y, x + y]); 
}

console.log(solve(4000000));
