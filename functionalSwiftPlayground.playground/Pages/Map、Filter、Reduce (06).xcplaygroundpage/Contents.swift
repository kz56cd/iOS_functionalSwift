//: [Previous](@previous)
/*:
 # Map、Filter、Reduce (06)
 
 - 関数を引数に取る関数、「高階関数」
 - ジェネリック型
 
 */
import Foundation


/*:
 ## ジェネリック型とAny型
 
 */

// ジェネリック型
func noOp<T>(_ x: T) -> T {
    return x
}

// Any型
func noOpAny(_ x: Any) -> Any {
    return x
}

/*:
 
> “noOpとnoOpAnyは両方ともあらゆる引数を取ります。重要な違いは、返される値がどの型であるかを知っていることです。noOpの定義を見ると、戻り値は入力値と同じ型であることがわかります。しかしnoOpAnyでは異なり、あらゆる型の値を返す可能性があります。入力値の型とも異なるかもしれません

*/

//func noOpAnyWrong(_ x: Any) -> Any {
//    return 0 // これが通ってしまい危険
//}
//
//func noOpWrong<T>(_ x: T) -> T {
//    return 0 // 型が一致しないためエラー
//}

/*:
> ジェネリック型を使うことで、型安全性を犠牲にすることなく柔軟性の高い関数を書けます。Any型を使うのであれば、その責任は自分自身で負わなければなりません。
*/
 
// -----------------------------

//: [Next](@next)



