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
    var kvoToken: NSKeyValueObservation?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    deinit {
        kvoToken?.invalidate()
    }
    
    //MARK: - Setup
    private func setupUI() {
        tableViewDelegateDataSource.rowSelected = self.rowSelected
        tableView.delegate = tableViewDelegateDataSource
        tableView.dataSource = tableViewDelegateDataSource
        self.view.addSubview(tableView)
        
        //Bind the data
        kvoToken = homeModel.observe(\.results, options: .new) { (results, change) in
            DispatchQueue.main.async { [weak self] in
                self?.tableViewDelegateDataSource.results = self?.homeModel.results?.results
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        
        addConstraints()
    }
    
    private func addConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
                self?.homeModel.results = results
            case .failure(let error):
                print("Error")
                print(error)
            }
        })
    }
    
    func rowSelected(index: Int) {
        print(index)
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    
}

