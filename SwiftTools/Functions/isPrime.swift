//  Created by Yongwoo Marco on 2021/05/17.
//  소수판별

import Foundation

// MARK: --- 소수판별
func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

// MARK: --- 에라토스테네스의 체
var check = [Bool]()

func sieveOfEratosthenes(_ maxNum: Int, _ check: inout [Bool]) {
    check = [Bool](repeating: true, count: maxNum + 1)

    for i in 2...Int(sqrt(Double(maxNum))) {
        for j in 2...maxNum/i {
            check[i*j] = false
        }
    }
}

sieveOfEratosthenes(999, &check)

func displayPrimes(_ check: [Bool]) -> [Int] {
    var primes = [Int]()
    for (i, v) in check.enumerated() {
        if v == true {
            primes.append(i)
        }
    }
    
    primes.removeFirst()
    primes.removeFirst()
    
    return primes
}


print(displayPrimes(check))
