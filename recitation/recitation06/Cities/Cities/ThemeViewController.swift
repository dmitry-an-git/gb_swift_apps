//
//  ThemeViewController.swift
//  Cities
//
//  Created by Dmitry An on 04/12/2023.
//

import UIKit

class ThemeViewController: UIViewController {
    
    private var button1:UIButton = {
        var button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = WhiteTheme().backgroundColor
        return button
    }()
    
    private var button2:UIButton  = {
        var button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = BlueTheme().backgroundColor
        return button
    }()
    
    private var button3:UIButton = {
        var button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = GreenTheme().backgroundColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        setupConstraints()
    }
    
    private func setupConstraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.widthAnchor.constraint(equalToConstant: 300),
            button1.heightAnchor.constraint(equalToConstant: 150),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.widthAnchor.constraint(equalToConstant: 300),
            button2.heightAnchor.constraint(equalToConstant: 150),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 10),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.widthAnchor.constraint(equalToConstant: 300),
            button3.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

extension ThemeViewController {
    @objc func tap1() {
        Theme.currentTheme = WhiteTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    @objc func tap2() {
        Theme.currentTheme = BlueTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    @objc func tap3() {
        Theme.currentTheme = GreenTheme()
        view.backgroundColor = Theme.currentTheme.backgroundColor
    }
}

