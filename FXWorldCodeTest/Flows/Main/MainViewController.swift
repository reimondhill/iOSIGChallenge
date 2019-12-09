import UIKit

class MainViewController: UIViewController {
    
    var viewModel: MainViewModel!{
        didSet {
            viewModel.delegate = self
        }
    }
    
    @IBOutlet weak var dashboardSelector: UISegmentedControl!
    @IBOutlet weak var containerView: ContainerView!
    
    
    @IBAction func dashboardSelectorValueChanged(_ sender: UISegmentedControl) {
        viewModel.currentIndex = dashboardSelector.selectedSegmentIndex
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
}


extension MainViewController: MainViewDelegate {
    func mainViewModel(currentIndexDidChange index: Int) {
        containerView.displayContent(for: viewModel.getCurrentViewController())
    }
}

private extension MainViewController {
    func setupView() {
        view.backgroundColor = .white
        
        dashboardSelector.removeAllSegments()
        for i in 0 ..< viewModel.numberOfTitle() {
            dashboardSelector.insertSegment(withTitle: viewModel.getTitle(for: i), at: i, animated: false)
        }
        
        dashboardSelector.selectedSegmentIndex = 0
        viewModel.currentIndex = dashboardSelector.selectedSegmentIndex
    }
}

