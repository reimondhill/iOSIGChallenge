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
    
    private var dashboardViewController: DashboardViewController {
        let vc = instantiateViewController(storyboardName: "Dashboard") as DashboardViewController
        vc.viewModel = DashboardViewModel(
            dashboardDataSource: DashboardDataSource(networkManager: Network())
        )
        return vc
    }
}
