class Algo {
  constructor(input) {
    this.input = input;
  }

  part1() {
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

    let count = 0;

    for (let i = 0; i < matrix.length; i++) {

      if (matrix[i][i * xFactor] === "#") {
        count += 1;
      }
    }

    return count;
  }

  part2() {}
}

export default Algo;
