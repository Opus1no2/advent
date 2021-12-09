const part1 = (input) => {
  const hash = {};
  const filtered = input.filter(r => /contain\s\d/.test(r));
  const parentBags = [];
  const bags = [];

  filtered.forEach((row) => {
    const parts = row.split(/(?=\s\d)/);
    const parent = parts.shift();

    const partentColor = parent.match(/^(?<color>.+?)(?=bags)/)
      .groups
      .color
      .trim();

    hash[partentColor] = {};

    parts.forEach((part) => {
      const num = part.match(/[0-9]/)[0];
      const bag = part.replace(/\d/, '').replace(/bags?.|,/, '').trim();
      hash[partentColor][bag] = num;
    });

  });

  for (let key in hash) {
    if (Object.keys(hash[key]).includes('shiny gold')) {
      parentBags.push(key);
    }
  }

  parentBags.forEach((bag) => {
    for (let key in hash) {
      if (Object.keys(hash[key]).includes(bag)) {
        bags.push(key);
      }
    }
  });

  return [...new Set(parentBags.concat(bags))].length;
};

const part2 = (input) => {
};

export { part1, part2 };
