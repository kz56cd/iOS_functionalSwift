//: [Previous](@previous)
/*:
 # ケーススタディ：Core Imageをラッピング (01)
 
 - 高階関数を使って既存のオブジェクト指向APIを小さい関数型コードでラッピングする
 
 */
import UIKit
import XCPlayground
import PlaygroundSupport

// https://qiita.com/mironal/items/36a0d6912522071b946a

typealias Filter = (CIImage) -> CIImage

// ブラー
func blur(radius: Double) -> Filter {
    return { image in
        let parameters: [String: Any] = [
            kCIInputRadiusKey: radius,
            kCIInputImageKey: image
        ]
        
        guard let filter = CIFilter(
            name: "CIGaussianBlur",
            withInputParameters: parameters
            ),
            let outputImage = filter.outputImage else {
                fatalError()
        }
        return outputImage
    }
}

// カラーオーバーレイ
func generate(color: UIColor) -> Filter {
    return { _ in
        let parameters = [kCIInputColorKey: CIColor(cgColor: color.cgColor)]
        
        guard let filter = CIFilter(
            name: "CIConstantColorGenerator",
            withInputParameters: parameters
            ),
            let outputImage = filter.outputImage else {
                fatalError()
        }
        return outputImage
    }
}
func compositeSourceOver(overlay: CIImage) -> Filter {
    return { image in
        let parameters = [
            kCIInputBackgroundImageKey: image,
            kCIInputImageKey: overlay
        ]
        
        guard let filter = CIFilter(
            name: "CISourceOverCompositing",
            withInputParameters: parameters
            ),
            let outputImage = filter.outputImage else {
                fatalError()
        }
        return outputImage
    }
}
func overlay(color: UIColor) -> Filter {
    return { image in
        let overlay = generate(color: color)(image).cropped(to: image.extent)
        return compositeSourceOver(overlay: overlay)(image)
    }
}

//: ### viewの作成

let viewController = UIViewController()
viewController.view.backgroundColor = .white
PlaygroundPage.current.liveView = viewController


let url = URL(string: "https://www.pakutaso.com/shared/img/thumb/NEKONEKOIMG_7878_TP_V.jpg")!
let image = CIImage(contentsOf: url)!
let radius = 5.0
let color = UIColor.red.withAlphaComponent(0.2)
let blurredImage = blur(radius: radius)(image)
let overlaidImage = overlay(color: color)(blurredImage)

let imageView = UIImageView(
    frame: CGRect(
        x: 0,
        y: 0,
        width: viewController.view.bounds.width,
        height: viewController.view.bounds.height
    )
)
imageView.image = UIImage(ciImage: overlaidImage)
viewController.view.addSubview(imageView)












//: [Next](@next)


