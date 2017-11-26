//: [Previous](@previous)
/*:
 # オプショナル型 (02)
 */

import Foundation

struct Order {
    let orderNumber: Int
    let person: Person?
}

struct Person {
    let name: String
    let address: Address?
}

struct Address {
    let streetName: String
    let city: String
    let state: String?
}

let order = Order(
    orderNumber: 42,
    person: nil
)

// NOTE: ネストしたデータを取り出したい場合、オプショナルチェーンで取り出すのが楽
if let myState = order.person?.address?.state {
    print("\(myState)")
} else {
    print("unknown state.")
}

// WIP


// stub
//: [Next](@next)
