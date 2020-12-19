class Algo {
  constructor(input) {
    this.input = input;
  }

  part1() {
    let answer;

    for (let i = 0; i < this.input.length - 1; i++) {
      for (let j = i + 1; j < this.input.length; j++) {
        if (this.input[i] + this.input[j] === 2020) {
          answer = this.input[i] * this.input[j];
        }
      }
    }
    return answer;
  }

  part2() {
    let answer;

    for (let i = 0; i < this.input.length - 2; i++) {
      for (let j = i + 1; j < this.input.length - 1; j++) {
        for (let z = j; z < this.input.length; z++) {
          if (this.input[i] + this.input[j] + this.input[z] === 2020) {
            answer = this.input[i] * this.input[j] * this.input[z];
          }
        }
      }
    }

    return answer;
  }
}

export default Algo;
