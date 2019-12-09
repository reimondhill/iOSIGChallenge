import UIKit
import SafariServices

public protocol Coordinator {
    func start()
    func present(viewController: UIViewController, from sender: UIViewController)
    func presentSFSafariViewController(url: URL, from sender: UIViewController)
}

extension Coordinator {
    func instantiateViewController<T: UIViewController>(storyboardName: String, bundle: Bundle? = nil, viewControllerName: String? = nil) -> T {
        let generatedVCName = viewControllerName ?? String(describing: T.self)

        guard let vc = UIStoryboard(name: storyboardName, bundle: bundle)
            .instantiateViewController(withIdentifier: generatedVCName) as? T else {
            fatalError("ViewController cannot be created")
        }
        
        return vc
    }
    
    func instantiateSFSafariViewController(url: URL) -> SFSafariViewController {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        return SFSafariViewController(url: url, configuration: config)
    }
}
