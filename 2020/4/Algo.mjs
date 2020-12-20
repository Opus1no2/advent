const validBirth = (num) => {
  return num >= 1920 && num <= 2002;
};

const validIssueYear = (num) => {
  return num >= 2010 && num <= 2020;
};

const validExpYear = (num) => {
  return num >= 2020 && num <= 2030;
};

const validHeight = (height) => {
  if (!/[a-zA-Z]/.test(height) || !/[0-9]/.test(height)) return false;

  const units = height.match(/[a-zA-Z]/g).join('');
  const num = Number(height.match(/[0-9]/g).join(''));

  if (units === 'cm') {
    return num >= 150 && num <= 193;
  }

  if (units === 'in') {
    return num >= 59 && num <= 76;
  }
}

const validHairColor = (color) => {
  if (!color) return false;

  const first = color[0];
  const alphaNum = color.match(/[a-zA-Z0-9]/g);

  return first === '#' && alphaNum.length === 6;
};

const validEyeColor = (color) => {
  if (!color) return false;

  const valids = ['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'];
  return valids.indexOf(color) > -1;
};

const validPid = (valid) => {
  if (!valid) return false;

  return valid.length === 9;
};

const requiredMap = {
  'byr': validBirth,
  'iyr': validIssueYear,
  'eyr': validExpYear,
  'hgt': validHeight,
  'hcl': validHairColor,
  'ecl': validEyeColor,
  'pid': validPid,
};

const requiredFields = Object.keys(requiredMap);

class Algo {
  constructor(input) {
    this.input = input;
  }

  part1() {
    let answer = 0;

    const entries = this.input.map((entry) => {
      return entry.split(/\n|\s/);
    });

    for (let i = 0; i < entries.length; i++) {
      let fields = [];

      for (let j = 0; j < entries[i].length; j++) {
        if (entries[i][j].length) {
          fields.push(entries[i][j].split(':')[0]);
        }
      }

      let count = 0;
      const uniqueFields = [...new Set(fields)];

      for (let j = 0; j < uniqueFields.length; j++) {
        if (requiredFields.indexOf(uniqueFields[j]) > -1) {
          count += 1;
        }
      }

      if (count === requiredFields.length) {
        answer += 1;
      }
    }

    return answer;
  }

  part2() {
    let answer = 0;

    const entries = this.input.map((entry) => {
      return entry.split(/\n|\s/);
    });

    for (let i = 0; i < entries.length; i++) {
      let fields = {};

      for (let j = 0; j < entries[i].length; j++) {
        if (entries[i][j].length) {
          const entry = entries[i][j].split(':');

          const key = entry[0];
          const val = entry[1];

          fields[key] = val;
        }
      }

      let ray = [];
      const uniqueFields = [...new Set(Object.keys(fields))];

      for (let key in fields) {
        if (key in requiredMap) {
          ray.push(requiredMap[key](fields[key]));
        }
      }

      const allTrue = ray.every(v => v);

      if (allTrue && ray.length === requiredFields.length) {
        answer += 1;
      }
    }

    return answer;

  }
}

export default Algo;
