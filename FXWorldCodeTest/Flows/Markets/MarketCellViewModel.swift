//
//  File.swift
//  FXWorldCodeTest
//
//  Created by Ramon Haro Marques on 09/12/2019.
//  Copyright © 2019 IG. All rights reserved.
//

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
