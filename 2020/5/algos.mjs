const part1 = (input) => {
  let seatIDs = [];

  const bin = (fb, min, max) => {
    const first = fb.shift();

    if (!fb.length) {
      return (first === 'F' || first === 'L') ? min : max;
    }

    if (first === 'F' || first === 'L') {
      const newMax = Math.floor((max - min) / 2) + min;
      return bin(fb, min, newMax);
    }

    if (first === 'B' || first === 'R') {
      const newMin = Math.ceil((max - min) / 2) + min;
      return bin(fb, newMin, max);
    }
  };

  for (let i = 0; i < input.length; i++) {
    const fb = input[i].match(/F|B/g);
    const lr = input[i].match(/R|L/g);

    const rowCount = bin(fb, 0, 127);
    const colCount = bin(lr, 0, 7);
    seatIDs.push(rowCount * 8 + colCount);
  }

  return Math.max(...seatIDs);
};

const part2 = (input) => {
  //return input;
};

export { part1, part2 };
