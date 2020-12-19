function test(correct, mine) {
  if (correct !== mine) {
    console.log('should be: ', correct);
    console.log('is really: ', mine);
  } else {
    console.log('You get a cake! The right answer was:', mine);
  }
}

export default test;
