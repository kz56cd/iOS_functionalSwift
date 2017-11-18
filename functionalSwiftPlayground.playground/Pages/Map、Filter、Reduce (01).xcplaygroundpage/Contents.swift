//: [Previous](@previous)
/*:
 # Map、Filter、Reduce (01)
 
 - 関数を引数に取る関数、「高階関数」
 - ジェネリック型
 
 */
import Foundation

// -------------------------

// 00
// 愚直に書いた場合
//func increment(array: [Int]) -> [Int] {
//    var result: [Int] = []
//    for x in array {
//        result.append(x + 1)
//    }
//    return result
//}
//
//func double(array: [Int]) -> [Int] {
//    var result: [Int] = []
//    for x in array {
//        result.append(x * 2)
//    }
//    return result
//}

// -------------------------

/*:
 ## Map
 */

// 01
// 配列の各要素を計算し新たなInt値を返す、抽象的な関数
//func compute(
//    array: [Int],
//    transform:(Int) -> Int
//    ) -> [Int] {
//    var result: [Int] = []
//    for x in array {
//        result.append(transform(x))
//    }
//    return result
//}

// 02
// 返り値をジェネリック型にし、汎用的に使えるようにする
//func genericCompute<T>(
//    array: [Int],
//    transform: (Int) -> T
//    ) -> [T] {
//    var result: [T] = []
//    for x in array {
//        result.append(transform(x))
//    }
//    return result
//}

// 03-01
// 引数 / 返り値共にジェネリック型に
//func map<Element, T>(
//    _ array: [Element],
//    transform: (Element) -> T
//    ) -> [T] {
//    var result: [T] = []
//    for x in array {
//        result.append(transform(x))
//    }
//    return result
//}

// 03-02
// mapを使い、genericComputeを定義する
//func genericCompute2<T>(
//    array: [Int],
//    transform: (Int) -> T
//    ) -> [T] {
//    return map(array, transform: transform)
//}

// 04-01
// ArrayのExtentionとしてmapを定義する
/*:

 > “我々はこの慣習に従い、ある特定の型に対して動作する関数はその型の拡張として定義することを勧めます。Xcodeのオートコンプリート機能が役立ち、不明瞭な名前を避けることができ、（たいていの場合）より明確に構造化されたコードを書けるという利点があります。”
 
 */

extension Array {
    func map<T>(_ transform: (Element) -> T) -> [T] {
        var result: [T] = []
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}

// 04-02
func genericCompute3<T>(
    _ array: [Int],
    transform: (Int) -> T)
    -> [T] {
    return array.map(transform)
}

// -------------------------

func increment(array: [Int]) -> [Int] {
    return genericCompute3(array){$0 + 1}
}

func double(array: [Int]) -> [Int] {
    return genericCompute3(array){$0 * 2}
}

func isEven(array: [Int]) -> [Bool] {
    return genericCompute3(array){$0 % 2 == 1}
}

//: [Next](@next)
