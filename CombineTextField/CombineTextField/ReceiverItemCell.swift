//
//  ReceiverItemCell.swift
//  CombineTextField
//
//  Created by Asaad Jaber on 14/08/2025.
//

import UIKit

class ReceiverItemCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var textLabel: UILabel!

    func setupUI() {
        textLabel = UILabel()
        textLabel.numberOfLines = 0
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
        ])
    }
}
