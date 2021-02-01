import Foundation

// 소수 판별
func isPrime(num: Int) -> Bool {
    if(num<4) {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if(num % i == 0) { return false }
    }
    return true
}

print(isPrime(num: 3))
print(isPrime(num: 14821))
