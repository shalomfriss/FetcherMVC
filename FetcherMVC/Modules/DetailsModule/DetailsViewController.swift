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
    
    lazy var favoriteSwitch: UISwitch = {
        let favSwitch = UISwitch()
        favSwitch.translatesAutoresizingMaskIntoConstraints = false
        return favSwitch
    }()
    
    var result:ResultVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        titleLabel.text = result?.title
    }
    
    private func setupUI() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(favoriteSwitch)
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            favoriteSwitch.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            favoriteSwitch.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20)
        ])
    }

}
