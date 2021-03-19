function hexToDec(hNum, position) {
    let result = 0;

    switch(hNum) {
        case "1":
        case "2":
        case "3":
        case "4":
        case "5":
        case "6":
        case "7":
        case "8":
        case "9":
            result += Number(hNum);
            break;
        case "A":
            result += 10;
            break;
        case "B":
            result += 11;
            break;
        case "C":
            result += 12;
            break;
        case "D":
            result += 13;
            break;
        case "E":
            result += 14;
            break;
        case "F":
            result += 15;
            break;
    }

    return result * (Math.pow(16, position));
}

function hexToDecArray(hNumber) {
    /*  Split all numbers individually with match()
     *  Reverse the order to get the rightmost digit at first index
     *  Use map() with the index to convert each hexadecimal number into decimal
     *  Use reduce() to sum the resulting array
     */
    return hNumber.match(/./g).reverse().map((num, index) => hexToDec(num, index)).reduce((accum, value) => accum += value);
}

console.log(hexToDecArray('86'));
