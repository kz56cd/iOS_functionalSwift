//: [Previous](@previous)
/*:
 # オプショナル型 (01)
 */

import Foundation

/*:
 ## オプショナルの基本
 */


let cities = ["Paris": 2241, "Madrid": 3165, "Amsterdam": 827, "Berlin": 3562]

//let madridPopulation: Int = cities["Madrid"]
let madridPopulation: Int? = cities["Madrid"]

// 00
// 愚直にnilチェックする場合
if madridPopulation != nil {
    print("the population of Madrid is \(madridPopulation! * 1000)")
} else {
    print("unknown city")
}

// 01
// Optional binding でアンラップする場合
if let madridPopulation = cities["Madrid"] {
    print("the population of Madrid is \(madridPopulation * 1000)")
} else {
    print("unknown city")
}

// -------------------------

// 02
// ??演算子を使う場合

// NOTE: 独自に定義してみる
//infix operator ??
//func ??<T>(optional: T?, defaultValue: () -> T) -> T {
//    if let x = optional {
//        return x
//    } else {
//        return defaultValue()
//    }
//}

// NOTE: 上記だと無名関数でラッピングする必要が生まれてしまう
//myOptional ?? { myDefalutValue }

/*:
> Swift標準ライブラリでの??演算子の定義はautoclosure型の属性を使っていて、明示的なクロージャの生成を必要としません。これは任意??演算子の引数を暗黙的にクロージャにラッピングします。すると、最初の例と同じインターフェイスが提供でき、かつdefaultValueを明示的にクロージャにラッピングする必要はありません。実際のSwift標準ライブラリの定義は以下のとおりです。
*/

infix operator ??
func ??<T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T {
    if let x = optional {
        return x
    } else {
        return try defaultValue()
    }
}


//: [Next](@next)

