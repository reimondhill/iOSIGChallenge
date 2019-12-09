import UIKit

final class FXWorldCoordinator: Coordinator {
    
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        window?.rootViewController = dashboardViewController
        window?.makeKeyAndVisible()
    }
    
    func present(viewController: UIViewController, from sender: UIViewController) {
        
    }
    
    func presentSFSafariViewController(url: URL, from sender: UIViewController) {
        sender.present(instantiateSFSafariViewController(url: url),
                       animated: true,
                       completion: nil)
    }
    
    private var dashboardViewController: DashboardViewController {
        let vc = instantiateViewController(storyboardName: "Dashboard") as DashboardViewController
        vc.viewModel = DashboardViewModel(
            dashboardDataSource: DashboardDataSource(networkManager: Network())
        )
        return vc
    }
}
