import fs from 'fs';
import Algo from './Algo.mjs';

const rawData = fs.readFileSync('./input.txt', 'utf-8');
const input = rawData.split("\n").filter(n => n).map(Number);

const algo = new Algo(input);

console.log('part 1: ', algo.part1(input));
console.log('part 2: ', algo.part2(input));
