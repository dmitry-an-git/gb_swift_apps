//
//  Presenter.swift
//  CleanSwift
//
//  Created by Dmitry An on 14/12/2023.
//

import Foundation

protocol PresenterProtocol {
    func updateScreen()
}

final class Presenter: PresenterProtocol {
    
    weak var controller: ViewControllerProtocol?
    
    func updateScreen() {
        
    }
}
