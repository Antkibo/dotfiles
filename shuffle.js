/*  Author: Humberto Rondon
 *  This program random sorts (shuffles) a given array
 */

function shuffle(array) {
    // First, create a set of randomized indices and make it an array
    // Then, create a new array and fill it with the data from the given array
    // using the randomized indices
    
    const nSet = new Set();

    while (nSet.size < array.length) {
        let rNumber = Math.floor(Math.random() * array.length);
        nSet.add(rNumber);
    }

    const nArray = new Array(array.length);

    for (let i = 0, indexArray = Array.from(nSet); i < array.length; ++i) {
        nArray[i] = array[indexArray[i]];
    }

    return nArray;
}

let myArr = "aabbccdd".repeat(4).split('');

console.log(shuffle(myArr));

