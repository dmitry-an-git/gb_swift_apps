//
//  CustomLabel.swift
//  test2
//
//  Created by Dmitry An on 29/11/2023.
//

import UIKit

class CustomLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        self.backgroundColor = .lightGray
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
