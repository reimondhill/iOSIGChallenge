
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
        
        view.backgroundColor = .white
        viewModel.currentIndex = dashboardSelector.selectedSegmentIndex
        
    }
    
}


extension MainViewController: MainViewDelegate {
    func mainViewModel(currentIndexDidChange index: Int) {
        containerView.displayContent(for: viewModel.getCurrentViewController())
    }
}

