import fs from 'fs';
import { part1, part2 } from './algos.mjs';
import test from '../../test.mjs';

const input = fs.readFileSync('./input.txt', 'utf-8')
	.split("\n\n")
	.filter(n => n)
	.map(v => v.replace(/\n/g, ''));

const testInput = fs.readFileSync('./test_input.txt', 'utf-8')
	.split("\n\n")
	.filter(n => n)
	.map(v => v.replace(/\n/g, ''));

test(11, part1(testInput));

console.log("answer for part 1:", part1(input));
