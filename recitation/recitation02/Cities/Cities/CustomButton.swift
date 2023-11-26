//
//  CustomButton.swift
//  Cities
//
//  Created by Dmitry An on 21/11/2023.
//

import UIKit

class CustomButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        setTitleColor(.systemGray, for: .highlighted)
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
