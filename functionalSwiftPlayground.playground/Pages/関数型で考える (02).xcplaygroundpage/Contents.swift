//: [Previous](@previous)
/*:
 # 関数型で考える (02)
 
 - 関数は「値」であり構造体や数値、真偽値などと変わらないということです。
 - この例における教訓は **慎重に型を選択すること** です
 
 */
import Foundation

typealias Distance = Double
// MEMO: 「Position型をBool型に変換する関数」としてtypealias化
typealias Region = (Position) -> Bool

struct Position {
    var x: Double
    var y: Double
}

extension Position {
    func minus(_ p: Position) -> Position {
        return Position(
            x: x - p.x,
            y: y - p.y
        )
    }
    func within(range: Distance) -> Bool {
        return sqrt(x * x + y * y) <= range
    }
    var length: Double {
        return sqrt(x * x + y * y)
    }
}

// Ship
struct Ship {
    var position: Position
    var firingRange: Distance
    var unsafeRange: Distance
}

extension Ship {
        func canSafelyEngageShip(
            ship target: Ship,
            friendly: Ship
            ) -> Bool {
            let rangeRegion = substract(
                circle(radius: unsafeRange),
                from: circle(radius: firingRange)
            )
            let firingRegion = shift(
                rangeRegion,
                by: position
            )
            let friendlyRegion = shift(
                circle(radius: unsafeRange),
                by: friendly.position
            )
            
            // 射程範囲と僚艦の範囲の差分領域
            let resultRegion = substract(
                friendlyRegion,
                from: firingRegion
            )
            return resultRegion(target.position)
        }
}

extension Ship {
    func circle(radius: Distance) -> Region {
        return { point in
            point.length <= radius
        }
    }
    
    func circle2(
        radius: Distance,
        center: Position
        ) -> Region {
        return { point in
            point.minus(center).length <= radius
        }
    }
    
    // 領域変換器
    func shift(
        _ region: @escaping Region,
        by offset: Position
        ) -> Region {
        return { point in
            region(point.minus(offset))
        }
    }
    
    // 領域を反転させ、新たな領域を定義する
    func invert(_ region: @escaping Region) -> Region {
        return { point in
            !region(point)
        }
    }
    
    // 2種の領域双方に存在するか
    func intersect(
        _ region: @escaping Region,
        with other: @escaping Region
        ) -> Region {
        return { point in
            region(point)  && other(point)
        }
    }
    
    // 2種の領域いずれかに存在するか
    func union(
        _ region: @escaping Region,
        with other: @escaping Region
        ) -> Region {
        return { point in
            region(point) || other(point)
        }
    }
    
    // 元の領域と、その領域から除去する領域の2つを引数に取り、新たな領域を定義
    func substract(
        _ region: @escaping Region,
        from original: @escaping Region
        ) -> Region {
        return intersect(original, with: invert(region))
    }
}


//: [Next](@next)

