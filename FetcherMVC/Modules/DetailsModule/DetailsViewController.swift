//
//  DetailsViewController.swift
//  FetcherMVC
//
//  Created by Shalom Friss on 2/20/22.
//

import UIKit

class DetailsViewController: UIViewController {

    lazy var titleLabel: UILabel =  {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        titleLabel.text = "testing"
    }
    
    private func setupUI() {
        self.view.addSubview(titleLabel)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 120),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
        ])
    }

}
