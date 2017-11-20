//: [Previous](@previous)
/*:
 # Map、Filter、Reduce (03)
 
 - 関数を引数に取る関数、「高階関数」
 - ジェネリック型
 
 */
import Foundation


/*:
 ## Reduce
 */

// 00
//func sum(integers: [Int]) -> Int {
//    var result: Int = 0
//    for x in integers  {
//        result += x
//    }
//    return result
//}
//
//func product(integers: [Int]) -> Int {
//    var result: Int = 1
//    for x in integers  {
//        result = x * result
//    }
//    return result
//}
//
//func concatenate(strings: [String]) -> String {
//    var result: String = ""
//    for string in strings {
//        result += string
//    }
//    return result
//}
//
//func prettyPrint(strings: [String]) -> String {
//    var result: String = "Entiries in the array xs:\n"
//    for string in strings {
//        result = "" + result + string + "\n"
//    }
//    return result
//}
//
//let intList = [1, 2, 3, 4]
//let stringList = ["I", " dont ",  " care"]
//sum(integers: intList)
//product(integers: intList)
//concatenate(strings: stringList)
//print(prettyPrint(strings: stringList))

/*:
 > “これらの関数に共通していることは何でしょうか？それは、変数resultをある値で初期化していることです。そして、入力された配列のすべての要素を走査し、resultに何らかのアップデートを加えていきます。このようなパターンを捉えて汎化した関数を定義するには、抽象化しなければならない情報が2つあります。resultに代入される初期値と、イテレーションごとのresultの更新に使用する関数です。”
 */

// -----------------------------

// 01
// NOTE: fold、fold_leftと呼ばれるもの（ -> Haslell, OCaml）
extension Array {
    func reduce<T>(_ initial: T, combine: (T, Element) -> T) -> T {
        var result = initial
        for x in self {
            result = combine(result, x) // combineをクロージャ化し、処理方法を外出ししている
        }
        return result
    }
}

func sumUsingReduce(integers: [Int]) -> Int {
    return integers.reduce(0) {result, x in
            result + x
        }
}

func productUsingReduce(integers: [Int]) -> Int {
    // NOTE: sumUsingReduceのようなクロージャでなく、直接演算子を渡すこともできる
    return integers.reduce(1, combine: *)
}

func concatUsingReduce(strings: [String]) -> String {
    return strings.reduce("", combine: +)
}

let intList = [1, 2, 3, 4]
let stringList = ["I", " dont ",  " care"]
sumUsingReduce(integers: intList)
productUsingReduce(integers: intList)
concatUsingReduce(strings: stringList)


//: [Next](@next)

