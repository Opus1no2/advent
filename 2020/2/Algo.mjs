class Algo {
  constructor(input) {
    this.input = input;
  }

  part1() {
    let count = 0;

    this.input.forEach((row) => {
      let occurances = 0;
      const parts = row.split(' ');
      const policy = parts[0];
      const min = Number(policy.split('-')[0]);
      const max = Number(policy.split('-')[1]);
      const needle = parts[1].replace(':', '');
      const haystack = parts[2];

      for (let i = 0; i < haystack.length; i++) {
        if (haystack[i] === needle) {
          occurances += 1;
        }
      }

      if (occurances >= min && occurances <= max) {
        count += 1;
      }
    });

    return count;
  }

  part2() {
    let count = 0;

    this.input.forEach((row) => {
      const parts = row.split(' ');
      const policy = parts[0];
      const pos1 = Number(policy.split('-')[0]);
      const pos2 = Number(policy.split('-')[1]);
      const needle = parts[1].replace(':', '');
      const haystack = parts[2];

      const inFirstPosition = haystack[pos1 - 1] === needle;
      const inSecondPosition = haystack[pos2 - 1] === needle;

      if ((inFirstPosition && !inSecondPosition) || (inSecondPosition && !inFirstPosition)) {
        count += 1;
      }
    });

    return count;
  }
}

export default Algo;
