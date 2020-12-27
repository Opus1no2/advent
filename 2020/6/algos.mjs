const part1 = (input) => {
  return input.map((v) => {
    return [...new Set(v)].length;
  }).reduce((p, c) => p + c);
};

const part2 = (input) => {
  let count = 0;
  const onePersons = input.filter(r => r.length === 1);
  const couples = input.filter(r => r.length > 1);

  count += onePersons.reduce((pre, curr) => {
    return pre + [...new Set(...curr)].length;
  }, 0);

  couples.forEach((row) => {
    let hash = [...row.join('')].reduce((pre, curr) => {
      if (!pre[curr]) {
        pre[curr] = 1;
      } else {
        pre[curr] += 1;
      }

      return pre;
    }, {});

    for (let key in hash) {
      if(hash[key] === row.length) {
        count += 1;
      }
    }
  });

  return count;
};

export { part1, part2 };
