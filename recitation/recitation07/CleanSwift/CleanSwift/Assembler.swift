//
//  Assembler.swift
//  CleanSwift
//
//  Created by Dmitry An on 14/12/2023.
//

import UIKit

final class Assembler {
    static func build() -> UIViewController {
        let presenter = Presenter()
        let interactor = Interactor(presenter: presenter)
        let viewController = ViewController(interactor: interactor)
        presenter.controller = viewController
        return viewController
    }
}
