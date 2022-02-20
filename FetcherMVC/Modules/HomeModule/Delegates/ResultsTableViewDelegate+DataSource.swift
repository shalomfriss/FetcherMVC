//
//  ResultsTableViewDelegate+DataSource.swift
//  FetcherMVC
//
//  Created by Shalom Friss on 2/20/22.
//

import Foundation
import UIKit

class ResultsTableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    public var results:MoviesearchResultsModel?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let result = results?.results?[indexPath.row] {
            let cell = UITableViewCell()
            cell.textLabel?.text = result.title
        }
        return UITableViewCell()
    }
    
    
}
