//: [Previous](@previous)
/*:
 # Map、Filter、Reduce (01)
 
 - 関数を引数に取る関数、「高階関数」
 - ジェネリック型
 
 */
import Foundation

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

// 配列の各要素を計算し新たなInt値を返す、抽象的な関数
func compute(
    array: [Int],
    transform:(Int) -> Int
    ) -> [Int] {
    var result: [Int] = []
    for x in array {
        result.append(transform(x))
    }
    return result
}

func increment(array: [Int]) -> [Int] {
    return compute(array: array, transform: {$0 + 1})
}

func double(array: [Int]) -> [Int] {
    return compute(array: array, transform: {$0 * 2})
}


//: [Next](@next)
