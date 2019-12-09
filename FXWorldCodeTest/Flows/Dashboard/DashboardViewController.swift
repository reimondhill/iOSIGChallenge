
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
        stackView.removeAllArrangedSubviews()
        for (i, text) in strings.enumerated(){
            let label = UILabel()
            label.numberOfLines = 0
            label.text = text
            label.tag = i
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(articleTouched)))
            stackView.addArrangedSubview(label)
        }
    }
}

extension DashboardViewController: DashboardDelegate {
    func didReceiveError(message: String) {
    }
    
    func didUpdateArticles() {
        DispatchQueue.main.async {
            let allArticleTitles = self.viewModel.getAllArticles().map { $0.title }
            self.updateStackView(with: allArticleTitles)
        }
    }
}

private extension DashboardViewController {
    @objc func articleTouched(_ gestureRecognizer: UIGestureRecognizer) {
        guard let index = gestureRecognizer.view?.tag,
            let articleURL = viewModel.getArticleURL(at: index)
            else { return }
        
        coordinator.presentSFSafariViewController(url: articleURL, from: self)
    }
}
