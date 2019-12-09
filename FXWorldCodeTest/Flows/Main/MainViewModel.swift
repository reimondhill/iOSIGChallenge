import UIKit


protocol MainViewDelegate: class {
    func mainViewModel(currentIndexDidChange index: Int)
}

final class MainViewModel {

    private let networkManager: Network
    private let titles: [String] = ["articles".localized, "markets".localized]
    private var viewControllers: [UIViewController] = []
    
    weak var delegate: MainViewDelegate?
    var currentIndex = 0 {
        didSet {
            delegate?.mainViewModel(currentIndexDidChange: currentIndex)
        }
    }

    init(networkManager: Network) {
        self.networkManager = networkManager
        initialiseViewControllers()
    }

}

extension MainViewModel {
    func numberOfTitle() -> Int {
        return viewControllers.count
    }
    func getTitle(for index: Int) -> String? {
        return titles[safeIndex: index]
    }
    
    func getCurrentViewController() -> UIViewController? {
        return viewControllers[safeIndex: currentIndex]
    }
    
    func viewController(at index: Int) -> UIViewController? {
        return viewControllers[safeIndex: index]
    }
}

private extension MainViewModel {
    private func initialiseViewControllers() {
        let newsViewController = DashboardViewController()
        newsViewController.viewModel = DashboardViewModel(dashboardDataSource: DashboardDataSource(networkManager: networkManager))
        
        viewControllers.append(newsViewController)
        
        let marketsViewController = MarketsViewController()
        marketsViewController.viewModel = MarketsViewModel(dataSource: MarketsDataSource(networkManager: networkManager))
        viewControllers.append(marketsViewController)
    }
}
