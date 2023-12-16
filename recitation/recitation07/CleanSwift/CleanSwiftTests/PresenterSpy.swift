//
//  PresenterSpy.swift
//  CleanSwift
//
//  Created by Dmitry An on 14/12/2023.
//

import Foundation

@testable import CleanSwift

final class PresenterSpy: PresenterProtocol {
    
    private(set) var wasUpdateCalled = false
    
    func updateScreen() {
        wasUpdateCalled = true
    }
    
}


