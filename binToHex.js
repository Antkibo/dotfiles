let bNumber = "00001111";

// Counts in groups of 4
function countOfOnes(bNumber) {
    let numbers = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F".split(',');

    let result = 0;

    for (let i = bNumber.length - 1, count = 0; i >= 0; --i, ++count) {
        if (bNumber[i] == "1") {
            result += Math.pow(2, count);
        }
    }

    return numbers[result];
}

function binToHex(bNumber) {
    return bNumber.match(/\d{1,4}/g).map(nibble => countOfOnes(nibble)).join('');
}

console.log(binToHex(bNumber));                 // Should be 0F
console.log(binToHex("11111111"));              // Should be FF
console.log(binToHex("1111 0001 1000 1111"));   // Should be F18F
