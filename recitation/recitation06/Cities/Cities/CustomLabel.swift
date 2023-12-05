//
//  CustomLabel.swift
//  Cities
//
//  Created by Dmitry An on 21/11/2023.
//

import UIKit

class CustomLabel: UILabel {
    init(_ text: String) {
        super.init(frame: .zero)
        self.text = text
        backgroundColor = .lightGray
        textColor = .systemBlue
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
