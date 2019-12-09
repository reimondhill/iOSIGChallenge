//
//  NewsViewController.swift
//  FXWorldCodeTest
//
//  Created by Ramon Haro Marques on 09/12/2019.
//  Copyright © 2019 IG. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel: DashboardViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    //UI
    private lazy var scrollView: UIScrollView = {
        let rtView = UIScrollView()
        
        rtView.bounces = false
        
        return rtView
    }()
    private lazy var stackView: UIStackView = {
        let rtView = UIStackView()
        
        rtView.alignment = .fill
        rtView.distribution = .fill
        rtView.axis = .vertical
        rtView.spacing = 18
        
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
        viewModel.fetchAllArticles()
        
    }
    
}


private extension DashboardViewController {

    func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        let stackViewHeight = stackView.heightAnchor.constraint(equalToConstant: 0)
        stackViewHeight.priority = .defaultLow
        stackViewHeight.isActive = true
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
