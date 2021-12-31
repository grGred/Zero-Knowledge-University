pragma circom 2.0.0;
include "./circim/circomlib/circuits/comparators.circom";
// We will be using LessThan function from circomlib

/* Logic:
    It's convinient to take a = 15, it can be represented as [1 1 1 1]. 
    The LessThan circuit attempts to build the bit representation of the minimum integer that requires 
    one (1) additional bit, which is 16 (represented with 5 bits: 1 0 0 0 0)
    The LessThan circuit will then add the result of (a - 10) to the 5-bit number. 
    If a - 10 < 0, then the most significant bit of 5-bit number will become 0.
    If a - 10 > 0, then the most significant bit of 5-bit number will remain 1.
    Signal output = 1 will give either 0 (meaning a >= 10) or 1 (meaning a < 10).
*/

// N is the number of bits the input  have.
template ex2(n) {
    // Declaration of signals.
    signal input a;
    signal output out;
    var x = 10;

    component lessThan = LessThan(n);
    // Constraints.
    lessThan.in[0] <-- a;
    lessThan.in[1] <-- x;

    out <== lessThan.out;
}

// I will assign n to be 32-bit, it should be enough.
component main = ex2(32);