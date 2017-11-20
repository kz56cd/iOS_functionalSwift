//: [Previous](@previous)
/*:
 # Map、Filter、Reduce (04)
 
 - 関数を引数に取る関数、「高階関数」
 - ジェネリック型
 
 */
import Foundation


/*:
 ## Reduce (flatten, map, filterへの応用)

    (Map、Filter、Reduce (03)の続き)
 
 */

// 00
//func flattten<T>(_ xss: [[T]]) -> [T] {
//    var result: [T] = []
//    for xs in xss {
//        result += xs
//    }
//    return result
//}

// -----------------------------

// 01
extension Array {
    func reduce<T>(_ initial: T, combine: (T, Element) -> T) -> T {
        var result = initial
        for x in self {
            result = combine(result, x)
        }
        return result
    }
    
    func mapUsingReduce<T>(_ transform: (Element) -> T) -> [T] {
        return reduce([]) { result, x in
            return result + [transform(x)]
        }
    }

    func filterUsingReduce(_ includeElement: (Element) -> Bool) -> [Element] {
        return reduce([]) { result, x in
            return includeElement(x) ? result + [x] : result
        }
    }
}

// -----------------------------

let intList = [1, 2, 3, 4]
print(intList.mapUsingReduce { $0 * 100 })
print(intList.filterUsingReduce {$0 > 2})

let stringList = ["I", "dont",  "care"]
print(stringList.mapUsingReduce { $0 + "😇" })
print(stringList.filterUsingReduce {$0.count <= 1})


//: [Next](@next)


