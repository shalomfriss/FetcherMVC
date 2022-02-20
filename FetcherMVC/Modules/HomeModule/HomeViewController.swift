//
//  HomeViewController.swift
//  FetcherMVC
//
//  Created by Shalom Friss on 2/20/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var homeModel = HomeModel()
    lazy var tableView:UITableView =  UITableView()
    lazy var tableViewDelegateDataSource:ResultsTableViewDelegateDataSource = ResultsTableViewDelegateDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    private func setupUI() {
        tableView.backgroundColor = UIColor.red
        tableViewDelegateDataSource.results = homeModel.results
        tableView.delegate = tableViewDelegateDataSource
        tableView.dataSource = tableViewDelegateDataSource
        self.view.addSubview(tableView)
        
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    private func loadData() {
        let searchService = MovieSearchService()
        searchService.fetch(searchTerm: "Lord", completion: { [weak self] results in
            switch(results) {
            case .success(let results):
                print("Success")
                print(results.results?[0].title)
                self?.homeModel.results = results
                self?.tableViewDelegateDataSource.results = self?.homeModel.results
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
               
            case .failure(let error):
                print("Error")
                print(error)
            }
        })
    }
    
    
    
    
}

