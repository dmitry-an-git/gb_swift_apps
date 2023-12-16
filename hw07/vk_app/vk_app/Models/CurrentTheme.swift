//
//  Theme.swift
//  vk_app
//
//  Created by Dmitry An on 04/12/2023.
//

import UIKit

final class CurrentTheme {
    static var currentTheme: AppTheme = WhiteTheme()
}

protocol AppTheme {
    var backgroundColor: UIColor { get }
    var fontColor: UIColor { get }
    var cellColor: UIColor { get }
}

final class WhiteTheme: AppTheme {
    var backgroundColor: UIColor = .white
    var fontColor: UIColor = .black
    var cellColor: UIColor = .white
}

final class NeutralTheme: AppTheme {
    var backgroundColor: UIColor = .lightGray
    var fontColor: UIColor = .darkGray
    var cellColor: UIColor = .systemGray
}

final class NightTheme: AppTheme {
    var backgroundColor: UIColor = .black
    var fontColor: UIColor = .white
    var cellColor: UIColor = .darkGray
}
