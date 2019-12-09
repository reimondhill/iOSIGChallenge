//
//  MarketTableViewCell.swift
//  FXWorldCodeTest
//
//  Created by Ramon Haro Marques on 09/12/2019.
//  Copyright © 2019 IG. All rights reserved.
//

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
