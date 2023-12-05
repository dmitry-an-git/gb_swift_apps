//
//  Theme.swift
//  Cities
//
//  Created by Dmitry An on 04/12/2023.
//

import UIKit

protocol AppTheme {
    var backgroundColor: UIColor { get }
}

final class Theme {
    static var currentTheme: AppTheme = WhiteTheme()
}

final class WhiteTheme: AppTheme {
    var backgroundColor: UIColor = .white
}

final class BlueTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 228/255, green: 231/255, blue: 1, alpha: 1)
}

final class GreenTheme: AppTheme {
    var backgroundColor: UIColor = UIColor(red: 206/255, green: 1, blue: 162/255, alpha: 1)
}

