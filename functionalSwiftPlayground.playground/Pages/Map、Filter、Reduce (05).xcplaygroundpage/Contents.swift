//: [Previous](@previous)
/*:
 # Map、Filter、Reduce (05)
 
 - 関数を引数に取る関数、「高階関数」
 - ジェネリック型
 
 */
import Foundation


/*:
 ## 使用例
 
 */

extension Array {
    func reduce<T>(_ initial: T, combine: (T, Element) -> T) -> T {
        var result = initial
        for x in self {
            result = combine(result, x)
        }
        return result
    }

    func map<T>(_ transform: (Element) -> T) -> [T] {
        return reduce([]) { result, x in
            return result + [transform(x)]
        }
    }

    func filter(_ includeElement: (Element) -> Bool) -> [Element] {
        return reduce([]) { result, x in
            return includeElement(x) ? result + [x] : result
        }
    }
}

// -----------------------------


// 00
struct City {
    let name: String
    let population: Int
}

extension City {
    func scallingPopulation() -> City {
        return City(name: name, population: population * 1000
        )
    }
}

let paris = City(name: "Paris", population: 2241)
let madrid = City(name: "Madrid", population: 4136)
let amsterdam = City(name: "Amsterdam", population: 811)
let berlin = City(name: "Berlin", population: 3745)
let cities = [
    paris,
    madrid,
    amsterdam,
    berlin
]

let result = cities
    .filter { $0.population > 1000 }
    .map { $0.scallingPopulation() }
    .reduce("City:Population") { result, c in
        return result + "\n" + "\(c.name):\(c.population)"
    }
print(result)

//: [Next](@next)



