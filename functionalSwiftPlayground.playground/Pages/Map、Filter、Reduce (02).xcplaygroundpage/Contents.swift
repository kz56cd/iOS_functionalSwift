//: [Previous](@previous)
/*:
 # Map、Filter、Reduce (02)
 
 - 関数を引数に取る関数、「高階関数」
 - ジェネリック型
 
 */
import Foundation


/*:
 ## Filter
*/

// 00
//func getSwiftFiles(in files: [String]) -> [String] {
//    var result: [String] = []
//    for file in files {
//        if file.hasSuffix(".swift") {
//            result.append(file)
//        }
//    }
//    return result
//}

// -----------------------------

// 01-01
extension Array {
    func filter(_ includeElement: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for x in self where includeElement(x) {
            result.append(x)
        }
        return result
    }
}

// 01-02
func getSwiftFiles2(in files: [String]) -> [String] {
    return files.filter { file in file.hasSuffix(".swift") }
}

// -----------------------------

let exampleFiles = ["README.md", "Helloworld.swift", "Flappybird.swift"]
print(getSwiftFiles2(in: exampleFiles))


//: [Next](@next)
