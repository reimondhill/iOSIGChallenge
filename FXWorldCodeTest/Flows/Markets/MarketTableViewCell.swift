import UIKit

class MarketTableViewCell: UITableViewCell {

    var viewModel: MarketCellViewModel? {
        didSet {
            updateView(viewModel: viewModel)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        textLabel?.text = nil
    }
}


private extension MarketTableViewCell {
    func updateView(viewModel: MarketCellViewModel?) {
        textLabel?.text = viewModel?.title
    }
}
