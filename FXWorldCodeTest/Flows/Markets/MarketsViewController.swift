//
//  MarketsViewController.swift
//  FXWorldCodeTest
//
//  Created by Ramon Haro Marques on 09/12/2019.
//  Copyright © 2019 IG. All rights reserved.
//

import UIKit

class MarketsViewController: UIViewController {

    //MARK: Properties
    var viewModel: MarketsViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    //UI
    private lazy var marketsTableView: UITableView = {
        let rtView = UITableView()
        
        rtView.register(MarketTableViewCell.self, forCellReuseIdentifier: MarketTableViewCell.identifier)
        rtView.tableFooterView = UIView()
        rtView.dataSource = self
        rtView.delegate = self
        
        return rtView
    }()
    
    
    //MARK: - Constructor
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        viewModel.fetchMarketsResponse()
    }
    
}


private extension MarketsViewController {
    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(marketsTableView)
        marketsTableView.translatesAutoresizingMaskIntoConstraints = false
        marketsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        marketsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        marketsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        marketsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension MarketsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.title(atSection: section)
    }
    
    //In the future it will have its own UITableViewCell with its own ViewModel
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let marketCell: MarketTableViewCell = tableView.dequeueReusableCell(withIdentifier: MarketTableViewCell.identifier, for: indexPath) as? MarketTableViewCell,
            let marketItem = viewModel.item(atSection: indexPath.section, row: indexPath.row)
            else {
                return UITableViewCell()
        }
        
        marketCell.viewModel = MarketCellViewModel(market: marketItem)
        
        return marketCell
    }
}

extension MarketsViewController: UITableViewDelegate {
    
}

extension MarketsViewController: MarketsDelegate {
    func marketsViewModel(didReceiveError message: String) {

    }
    
    func marketsViewModelDidUpdate() {
        marketsTableView.reloadData()
    }
}
