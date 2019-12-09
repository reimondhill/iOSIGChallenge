
import UIKit

public protocol Coordinator {}

extension Coordinator {
    func instantiateViewController<T: UIViewController>(storyboardName: String, bundle: Bundle? = nil, viewControllerName: String? = nil) -> T {
        let generatedVCName = viewControllerName ?? String(describing: T.self)

        guard let vc = UIStoryboard(name: storyboardName, bundle: bundle)
            .instantiateViewController(withIdentifier: generatedVCName) as? T else {
            fatalError("ViewController cannot be created")
        }
        
        return vc
    }
}
