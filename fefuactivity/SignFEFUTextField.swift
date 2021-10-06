//
//  SignFEFUTextField.swift
//  fefuactivity
//
//  Created by Егор Блинов on 06.10.2021.
//

import UIKit

class SignFEFUTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        layer.cornerRadius = 6.62
        layer.borderWidth = 1.1
        layer.borderColor = UIColor(named: "TextFieldBorderColor")?.cgColor
    }
}
