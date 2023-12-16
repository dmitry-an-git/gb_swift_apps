//
//  ViewController.swift
//  CleanSwift
//
//  Created by Dmitry An on 14/12/2023.
//

import UIKit

protocol ViewControllerProtocol: AnyObject {
    func updateScreen()
}

class ViewController: UIViewController, ViewControllerProtocol {

    var interactor: InteractorProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    init(interactor: InteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        
    }

    func updateScreen() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

