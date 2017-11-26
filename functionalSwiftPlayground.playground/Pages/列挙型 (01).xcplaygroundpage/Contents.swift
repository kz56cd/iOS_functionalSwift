//: [Previous](@previous)
/*:
 # 列挙型 (01)
 */

import Foundation

enum LookupError:  Error {
    case capitalNotFound
    case populationNotFound
}

enum PopulationResult {
    case success(Int)
    case error(LookupError)
}

let exampleSuccess: PopulationResult = .success(1000)

// Int? でなく、PopulationResultを返すことで、成否を判断できるようになる
func populationOfCapital(country: String) -> PopulationResult {
    guard let capital = capitals[country] else {
        return .error(.capitalNotFound)
    }
    guard let population = cities[capital] else {
        return .error(.populationNotFound)
    }
    return .success(population)
}

switch populationOfCapital(country: "Madrid") {
case let .success(population):
    print("Success: capital has \(population) thousand inhabitants.")
case let .error(error):
    print("Error: \(error)")
}

// stub
//: [Next](@next)

