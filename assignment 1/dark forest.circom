pragma circom 2.0.0;
include "./circom/circomlib/circuits/comparators.circom";
include "./circom/circomlib/circuits/mimcsponge.circom";
include "./circom/circomlib/circuits/bitify.circom";


function gcd(left_operand, right_operand){
    var temp;

    // Pass by reference
    var left;
    var right;
    left = left_operand;
    right = right_operand;

    while (right != 0){
        temp = left % right;
        left = right;
        right = temp;
    }
    return left;
}

function isPrime(num) {
  for(var i = 2; i < num; i++) {
    if(num % i == 0) {return 0; }
  }
  return num > 1;
}

template Main() {
    signal input x;
    signal input y;
    signal input r;
    signal input s;

    signal output h;

    /* check x^2 + y^2 < r^2 */
    component comp = LessThan(64);
    signal xSq;
    signal ySq;
    signal rSq;
    xSq <== x * x;
    ySq <== y * y;
    rSq <== r * r;


    comp.in[0] <== xSq + ySq;
    comp.in[1] <== rSq;
    comp.out === 1;

    component comp32 = LessThan(64);
    signal sSq;
    sSq <== s * s;

    comp32.in[0] <== xSq + ySq;
    comp32.in[1] <== sSq;
    comp32.out === 0;

    signal left;
    signal right;
    var gcd1;
    left <== x;
    right <== y;
    gcd1 = gcd(right, left);

    // is_prime checks starts the counter at 2, so if is_prime(num)===1 than it either is a prime number or is 1
    signal gcd_prime;
    gcd_prime <-- gcd1;

    var is_prime_num = isPrime(gcd_prime);
    component is_zero = IsZero();

    is_zero.in <-- is_prime_num;
    is_zero.out === 1;

    component mimc = MiMCSponge(2, 220, 1);

    mimc.ins[0] <== x;
    mimc.ins[1] <== y;
    mimc.k <== 0;

    h <== mimc.outs[0];
}

component main = Main();