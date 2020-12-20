class Algo {
  constructor(input) {
    this.input = input;
  }

  part1() {
    let count = 0;
    const xFactor = 3
    const y = this.input.length - 1;
    const x = y * xFactor;

    const cols = Math.ceil(x / (this.input[0].length - 1));

    let matrix = [];

    for (let i = 0; i < this.input.length; i++) {
      let str = '';

      for (let j = 0; j < cols; j++) {
        str += this.input[i];
      }

      matrix.push(str);
    }

    for (let i = 0; i < matrix.length; i++) {
      if (matrix[i][i * xFactor] === "#") {
        count += 1;
      }
    }

    return count;
  }

  part2(xFactor, yFactor) {
    let count = 0;
    const y = this.input.length - 1;
    const x = y * xFactor;

    const cols = Math.ceil(x / (this.input[0].length - 1));

    let matrix = [];

    for (let i = 0; i < this.input.length; i++) {
      let str = '';

      for (let j = 0; j < cols + 1; j++) {
        str += this.input[i];
      }

      matrix.push(str);
    }

    for (let i = yFactor, j = xFactor; i < matrix.length; i += yFactor, j += xFactor) {
      if (matrix[i][j] === "#") {
        count += 1;
      }
    }

    return count;
  }
}

export default Algo;
