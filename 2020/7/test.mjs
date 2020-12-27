import fs from 'fs';
import { part1, part2 } from './algos.mjs';
import test from '../../test.mjs';

const input = fs.readFileSync('./input.txt', 'utf-8').split("\n").filter(n => n);
const testInput = fs.readFileSync('./test_input.txt', 'utf-8').split("\n").filter(n => n);

//test(4, part1(testInput));
//test(0, part2(testInput));

console.log("answer for part 1:", part1(input));
//console.log("answer for part 2:", part2(input));
