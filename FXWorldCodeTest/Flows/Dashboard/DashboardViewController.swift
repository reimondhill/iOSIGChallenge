
import UIKit

class DashboardViewController: UIViewController {
    var viewModel: DashboardViewModel!
    
    @IBOutlet private weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.fetchAllArticles()
    }
    
    func updateStackView(with strings: [String]) {
        strings.forEach { text in
            let label = UILabel()
            label.numberOfLines = 0
            label.text = text
            stackView.addArrangedSubview(label)
        }
    }
}

extension DashboardViewController: DashboardDelegate {
    func didReceiveError(message: String) {
    }
    
    func didUpdateArticles() {
        DispatchQueue.main.async {
            let allArticleTitles = self.viewModel.allSections
                .flatMap { self.viewModel.articles(for: $0) }
                .map { $0.title }

            DispatchQueue.main.async {
                self.updateStackView(with: allArticleTitles)
            }

        }
    }
}
