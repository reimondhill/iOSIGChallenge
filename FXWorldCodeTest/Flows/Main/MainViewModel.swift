import UIKit


protocol MainViewDelegate: class {
    func mainViewModel(currentIndexDidChange index: Int)
}

final class MainViewModel {

    private let networkManager: Network
    weak var delegate: MainViewDelegate?
    var currentIndex = 0 {
        didSet {
            delegate?.mainViewModel(currentIndexDidChange: currentIndex)
        }
    }
    private (set) var viewControllers: [UIViewController] = []
    
    init(networkManager: Network) {
        self.networkManager = networkManager
        initialiseViewControllers()
    }
    
    func getCurrentViewController() -> UIViewController? {
        return viewControllers[safeIndex: currentIndex]
    }
    
    func viewController(at index: Int) -> UIViewController? {
        return viewControllers[safeIndex: index]
    }
    
    private func initialiseViewControllers() {
        let newsViewController = DashboardViewController()
        newsViewController.viewModel = DashboardViewModel(dashboardDataSource: DashboardDataSource(networkManager: networkManager))
        
        viewControllers.append(newsViewController)
        
        let marketsViewController = MarketsViewController()
        marketsViewController.viewModel = MarketsViewModel(dataSource: MarketsDataSource(networkManager: networkManager))
        viewControllers.append(marketsViewController)
    }

}
