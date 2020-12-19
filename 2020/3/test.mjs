import fs from 'fs';
import Algo from './Algo.mjs';
import test from '../../test.mjs';

const rawTestInput = fs.readFileSync('./test_input.txt', 'utf-8');
const testInput = rawTestInput.split("\n").filter(n => n);

const testAlgo = new Algo(testInput);
const answer = 8;
//const answer2 = 2;

test(answer, testAlgo.part1());
//test(answer2, testAlgo.part2());

const input = fs.readFileSync('./input.txt', 'utf-8').split("\n").filter(n => n);
const algo = new Algo(input);

console.log("answer for part 1:", algo.part1());
//console.log("answer for part 2:", algo.part2());

