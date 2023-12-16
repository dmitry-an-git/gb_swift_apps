//
//  Interactor.swift
//  CleanSwift
//
//  Created by Dmitry An on 14/12/2023.
//

import Foundation

protocol InteractorProtocol {
    func updateScreen()
}

final class Interactor: InteractorProtocol {
    
    private let presenter: PresenterProtocol
    
    enum Cases {
        case first, last, all
    }
    
    init(presenter: PresenterProtocol) {
        self.presenter = presenter
    }
    
    func updateScreen() {
        presenter.updateScreen()
    }
    
//    Первая функция на вход принимает число. Если число больше 10, то возвращается полученное число, увеличенное в три раза, если меньше или равно, то уменьшенное на 3.

    
    func modifyNumber(number: Int) -> Int {
        return number > 10 ? number*3 : number - 3
    }
    
//    Добавить перечисление, в котором будет три кейса: first, last, all. Написать функцию, которая на вход принимает строку и  параметр с типом ранее созданного перечисления.Причем параметр - опционал. Функция возвращает массив символов. Если передано first, то необходимо вернуть массив, в котором будет содержаться только первый символ строки. Если передано last, то необходимо вернуть массив, в котором будет содержаться только последний символ строки. Если передано all, то необходимо вернуть массив, в котором будут содержаться все символы строки. Если передана пустая строка или nil, то вернуть пустой массив.

    
    func someFunc(text: String, selector: Cases?) -> [Character] {
        
        guard !text.isEmpty, selector != nil else {
            return []
        }

        switch selector {
        case .first:
            return [text.first!]
        case .last:
            return [text.last!]
        case .all:
            return Array(text)
        case .none:
            return []
        }
    }
    
    
//    Написать функцию, которая на вход принимает строку для проверки(далее строка a) и строку, которая может содержаться в строке a(далее строка b). Если в строке a есть строка b, то необходимо вызвать функцию презентера updateScreen.

    internal func stringsFunc(a: String, b: String) {
        if a.contains(b) {
                presenter.updateScreen()
           }
    }
    
}
