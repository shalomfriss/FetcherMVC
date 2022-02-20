//
//  ResultsTableViewDelegate+DataSource.swift
//  FetcherMVC
//
//  Created by Shalom Friss on 2/20/22.
//

import Foundation
import UIKit

class ResultsTableViewDelegateDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    public var results:[ResultVO]?
    public var rowSelected: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let result = results?[indexPath.row] {
            let cell = ResultsTableCell()
            cell.setupCell(result: result)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowSelected?(indexPath.row)
    }
}
