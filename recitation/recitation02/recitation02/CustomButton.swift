//
//  CustomButton.swift
//  recitation02
//
//  Created by Dmitry An on 20/11/2023.
//

import UIKit

class CustomButton: UIButton {
    
    init(text: String) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
