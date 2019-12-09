import Foundation

protocol MarketsDelegate: class {
    func marketsViewModel(didReceiveError message: String)
    func marketsViewModelDidUpdate()
}

final class MarketsViewModel {
    weak var delegate: MarketsDelegate?
    
    var markets: [[Market]] = [[]]
    private let dataSource: MarketsDataSource
    
    init(dataSource: MarketsDataSource) {
        self.dataSource = dataSource
    }
    
}

extension MarketsViewModel {
    
    func numberOfSections() -> Int{
        return markets.count
    }
    
    func title(atSection section: Int) -> String {
        switch section {
        case 0:
            return "currencies".localized
        case 1:
            return "commodities".localized
        case 2:
            return "indices".localized
        default:
            return ""
        }
    }
    
    func numberOfItems(inSection section: Int) -> Int{
        return markets[safeIndex: section]?.count ?? 0
    }
    
    func item(atSection section: Int, row: Int) -> Market? {
        return markets[safeIndex: section]?[safeIndex: row]
    }
    
    func fetchMarketsResponse() {
        
        dataSource.loadMarketsdData { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let marketsResponse):
                var markets = [[Market]]()
                markets.append(marketsResponse.currencies)
                markets.append(marketsResponse.commodities)
                markets.append(marketsResponse.indices)
                strongSelf.markets = markets
                
                DispatchQueue.main.async {
                    strongSelf.delegate?.marketsViewModelDidUpdate()
                }
                
            case .failure(let error):
                strongSelf.delegate?.marketsViewModel(didReceiveError: error.localizedDescription)
            }
            
        }
        
    }
    
}
