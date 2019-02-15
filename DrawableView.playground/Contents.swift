//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

extension UIView {
    func render(actions: (UIGraphicsImageRendererContext) -> Void) {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = renderer.image(actions: actions)
        self.backgroundColor = UIColor(patternImage: image)
    }
}

class MyViewController : UIViewController {
    override func loadView() {
        self.view = UIView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // 楕円をランダムに描画
        self.view.render { (context) in
            context.cgContext.clear(self.view.bounds)

            for _ in 0...50 {
                let rect = CGRect(
                    x: .random(in: 0...300),
                    y: .random(in: 0...600),
                    width: .random(in: 50...100),
                    height: .random(in: 50...100)
                )

                let color = UIColor(
                    red: .random(in: 0...1),
                    green: .random(in: 0...1),
                    blue: .random(in: 0...1),
                    alpha: 1.0
                )
                color.setFill()
                context.cgContext.fillEllipse(in: rect)
            }
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
