//: [Previous](@previous)
/*:
 # 関数型で考える (01)
 */
import Foundation

typealias Distance = Double

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
    
//    func canSafelyEngage(
//        ship target: Ship,
//        friendly: Ship
//    ) -> Bool {
//        let dx = target.position.x - position.x
//        let dy = target.position.y - position.y
//        let targetDistance = sqrt(dx * dx + dy * dy)
//        let friendlyDx = friendly.position.x - target.position.x
//        let friendlyDy = friendly.position.y - target.position.y
//        let friendlyDistance = sqrt(friendlyDx * friendlyDx + friendlyDy * friendlyDy)
//
//        return targetDistance <= firingRange
//            && targetDistance > unsafeRange
//            && friendlyDistance > unsafeRange
//    }
    
/*:
 ## 問題点
 > 現時点のcanSafelyEngage(ship:friendly:)では、
 > 戻り値を構成する真偽値の条件の組み合わせの中にその動作が組み込まれてしまっています。
 */
    
    func canSafelyEngageShip2(
        ship target: Ship,
        friendly: Ship
        ) -> Bool {
        let targetDistance = target.position.minus(position).length
        let friendlyDistance = friendly.position.minus(target.position).length
        return targetDistance <= firingRange
            && targetDistance > unsafeRange
            && friendlyDistance > unsafeRange
    }
}

//: [Next](@next)
