//
//  ResultsTableCell.swift
//  FetcherMVC
//
//  Created by Shalom Friss on 2/20/22.
//

import Foundation
import UIKit

class ResultsTableCell: UITableViewCell {
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(result: ResultVO) {
        self.addSubview(title)
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        title.text = result.title
    }

}
