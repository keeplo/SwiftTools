import Foundation

var hashTable = HashTable<String, String>(capacity: 5)

// Key: firstName 추가
hashTable["firstName"] = "Steve"

if let firstName = hashTable["firstName"] {
  print(firstName)
}

if let lastName = hashTable["lastName"] {
  print(lastName)
} else {
  print("lastName key not in hash table")
}

// Key: firstName 삭제
hashTable["firstName"] = nil

if let firstName = hashTable["firstName"] {
  print(firstName)
} else {
  print("firstName key is not in the hash table")
}

if let lastName = hashTable["lastName"] {
  print(lastName)
} else {
  print("lastName key not in hash table")
}

// https://www.raywenderlich.com/206-swift-algorithm-club-hash-tables
