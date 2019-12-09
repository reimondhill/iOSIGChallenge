import UIKit

final class FXWorldCoordinator: Coordinator {
    
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }
    
    func present(viewController: UIViewController, from sender: UIViewController) {
        
    }
    
    func presentSFSafariViewController(url: URL, from sender: UIViewController) {
        sender.present(instantiateSFSafariViewController(url: url),
                       animated: true,
                       completion: nil)
    }
    
    private var mainViewController: MainViewController {
        let vc = instantiateViewController(storyboardName: "Main") as MainViewController
        
        if ProcessInfo.processInfo.arguments.contains("TEST"){
            print("I am testing")
            vc.viewModel = MainViewModel(networkManager: MockNetwork())
        }
        else{
            vc.viewModel = MainViewModel(networkManager: NetworkManager())
        }
        return vc
    }
    
}
