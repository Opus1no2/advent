import Algo from './Algo.mjs';
import test from '../../test.mjs';

const input = [
  1721,
  979,
  366,
  299,
  675,
  1456,
];

const algo = new Algo(input);

const answer = 514579;
const solution = algo.part1(input);

test(answer, solution);

const answer2 = 241861950;
const solution2 = algo.part2(input);

test(answer2, solution2);

