const part1 = (input) => {
  return input.map((v) => {
    return [...new Set(v)].length;
  }).reduce((p, c) => p + c);
};

const part2 = (input) => {

};

export { part1, part2 };
