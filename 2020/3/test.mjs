import fs from 'fs';
import Algo from './Algo.mjs';
import test from '../../test.mjs';

const rawTestInput = fs.readFileSync('./test_input.txt', 'utf-8');
const testInput = rawTestInput.split("\n").filter(n => n);
const testAlgo = new Algo(testInput);

const input = fs.readFileSync('./input.txt', 'utf-8').split("\n").filter(n => n);
const algo = new Algo(input);

test(2, testAlgo.part2(1, 1));
test(7, testAlgo.part2(3, 1));
test(3, testAlgo.part2(5, 1));
test(4, testAlgo.part2(7, 1));
test(2, testAlgo.part2(1, 2));
console.log("answer for part 1:", algo.part1());

const args = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2],
];

let answers = [];
let testAnswers = [];

for (let i = 0; i < args.length; i++) {
  answers.push(algo.part2(...args[i]));
  testAnswers.push(testAlgo.part2(...args[i]));
}

let testAnswer = testAnswers.reduce((pre, curr) => {
  return pre * curr;
});

let answer = answers.reduce((pre, curr) => {
  return pre * curr;
});

console.log("test answer for part 2:", testAnswer);
console.log("answer for part 2:", answer);
