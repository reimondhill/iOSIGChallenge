import Foundation

class MarketCellViewModel {
    
    private let market: Market
    var title: String {
        return market.displayName
    }
    
    init(market: Market) {
        self.market = market
    }
    
}
