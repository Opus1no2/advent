import fs from 'fs';
import Algo from './Algo.mjs';
import test from '../../test.mjs';

const rawTestInput = fs.readFileSync('./test_input.txt', 'utf-8').split("\n\n");
const validInput = fs.readFileSync('./valid_test_input.txt', 'utf-8').split("\n\n");
const invalidInput = fs.readFileSync('./invalid_test_input.txt', 'utf-8').split("\n\n");
const input = fs.readFileSync('./input.txt', 'utf-8').split("\n\n");

const algo = new Algo(input);
const testAlgo = new Algo(rawTestInput);
const testValidAlgo = new Algo(validInput);
const invalidAlgo = new Algo(invalidInput);

test(2, testAlgo.part1());
test(4, testValidAlgo.part2());
test(0, invalidAlgo.part2());

console.log("answer for part 1:", algo.part1());
console.log("answer for part 2:", algo.part2());
