//
//  CustomButton.swift
//  Cities
//
//  Created by Dmitry An on 21/11/2023.
//

import UIKit

class CustomButton: UIButton {
    override init(text: String) {
        super.init()
        setTitle(text, for: .normal)
        setTitleColor(.systemBlue, for: .normal)
    }
}
