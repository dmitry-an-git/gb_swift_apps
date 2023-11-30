//
//  ViewController.swift
//  test2
//
//  Created by Dmitry An on 29/11/2023.
//

import UIKit

class ViewController: UIViewController {

    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("go to navigation controller", for: .normal)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.addTarget(self, action: #selector(goToTableViewController), for: .touchUpInside)
        setConstraints()
        // Do any additional setup after loading the view.
    }

}

extension ViewController {
    @objc func goToTableViewController() {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
}


#Preview {
    ViewController()
}
