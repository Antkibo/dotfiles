function pascal(number) {
    let arr = [];

    let half = Math.ceil(number / 2);

    for (let i = 0; i < half; ++i) {
        if (i == 0) {
            arr.push(1);
        } else {
            let range;

            if (i < half - 1) {
                range = 0;
            } else {
                range = 1;
            }

            if (i <= half - 1 && number % 2 == 0) {
                range = 0;
            }
            
            let previousList = pascal(number - 1);
            console.log('hi');
            arr.push(previousList[i - 1] + previousList[i - range]);
        }
    }

    return arr;
}

function helper(number) {
    let arr = pascal(number);

    let newArr;

    if (number % 2 == 0) {
        newArr = arr;
    } else {
        newArr = arr.slice(0, Math.ceil(number / 2) - 1);
    }

    for (let i = newArr.length - 1; arr.length != number; --i) {
        arr.push(newArr[i]);
    }

    return arr;
}

console.log(helper(5));
