let hex = "FF"

function toAscii(number) {
    let chars = new Array(128);

    chars[65] = "A";
    chars[66] = "B";
    chars[67] = "C";
    chars[68] = "D";
    chars[69] = "E";
    chars[70] = "F";
    chars[71] = "G";
    chars[72] = "H";
    chars[73] = "I";
    chars[74] = "J";
    chars[75] = "K";
    chars[76] = "L";
    chars[77] = "M";
    chars[78] = "N";
    chars[79] = "O";
    chars[80] = "P";
    chars[81] = "Q";
    chars[82] = "R";
    chars[83] = "S";
    chars[84] = "T";
    chars[85] = "U";
    chars[86] = "V";
    chars[87] = "W";
    chars[88] = "X";
    chars[89] = "Y";
    chars[90] = "Z";

    return chars[number];
}

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

console.log(toAscii(hexToDecArray("50")));
