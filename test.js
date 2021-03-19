function pascal(number) {
    let arr = [];

    for (let i = 0; i < number; ++i) {
        if (i == 0) {
            arr.push(1);
        } else if (i == number - 1) {
            arr.push(1);
        } else {
            let previousList = pascal(number - 1);
            arr.push(previousList[i - 1] + previousList[i]);
        }
    }

    return arr;
}

console.log(pascal(11))
