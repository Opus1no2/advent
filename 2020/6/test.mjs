import fs from 'fs';
import { part1, part2 } from './algos.mjs';
import test from '../../test.mjs';

const input = fs.readFileSync('./input.txt', 'utf-8')
	.split("\n\n")
	.filter(n => n)
	.map(v => v.replace(/\n/g, ''));

const input2 = fs.readFileSync('./input.txt', 'utf-8')
	.split("\n\n")
	.filter(n => n)
	.map(v => v.split(/\n/g))
  .filter(n => n);

const testInput = fs.readFileSync('./test_input.txt', 'utf-8')
	.split("\n\n")
	.filter(n => n)
	.map(v => v.replace(/\n/g, ''));

const testInput2 = fs.readFileSync('./test_input.txt', 'utf-8')
	.split("\n\n")
	.filter(n => n)
	.map(v => v.split(/\n/g)
	.filter(n => n));

test(11, part1(testInput));
test(6, part2(testInput2));

console.log("answer for part 1:", part1(input));
console.log("answer for part 2:", part2(input2));
