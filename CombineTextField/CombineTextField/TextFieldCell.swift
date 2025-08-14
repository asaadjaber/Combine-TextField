//
//  TextFieldCell.swift
//  CombineTextField
//
//  Created by Asaad Jaber on 14/08/2025.
//

import UIKit

class TextFieldCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var textField: UITextField!
    
    func setupUI() {
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Tap text to start typing..."
        
        contentView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
        ])
    }
}
