//
//  NewViewController.swift
//  Cities
//
//  Created by Dmitry An on 15/11/2023.
//

// Создать новый UIViewController, сделать ему зеленый фон. Задать экрану заголовок “Next ViewController”

import UIKit

final class NextViewController: UIViewController {
        
    private var field1: UIView = {
        let field = UIView()
        field.backgroundColor = .red
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private var field2: UIView = {
        let field = UIView()
        field.backgroundColor = .purple
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private var field3: UIView = {
        let field = UIView()
        field.backgroundColor = .blue
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private var field4: UIView = {
        let field = UIView()
        field.backgroundColor = .brown
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private var field5: UIView = {
        let field = UIView()
        field.backgroundColor = .cyan
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private var field6: UIView = {
        let field = UIView()
        field.backgroundColor = .orange
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private func loadFields() {
        view.addSubview(field1)
        view.addSubview(field2)
        view.addSubview(field3)
        view.addSubview(field4)
        view.addSubview(field5)
        view.addSubview(field6)
    }
    
    private func setConstraints() {
        let margin: Double = 10
        NSLayoutConstraint.activate([
            // MARK: field 1
            field1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            field1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: margin),
            field1.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -margin/2),
            field1.heightAnchor.constraint(equalToConstant: 150),
            // MARK: field 2
            field2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            field2.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: margin/2),
            field2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -margin),
            field2.heightAnchor.constraint(equalTo: field1.heightAnchor, constant: 0),
            // MARK: field 3
            field3.topAnchor.constraint(equalTo: field1.bottomAnchor, constant: margin),
            field3.leftAnchor.constraint(equalTo: view.leftAnchor, constant: margin),
            field3.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -margin/2),
            field3.heightAnchor.constraint(equalTo: field1.heightAnchor, constant: 0),
            // MARK: field 4
            field4.topAnchor.constraint(equalTo: field2.bottomAnchor, constant: margin),
            field4.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: margin/2),
            field4.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -margin),
            field4.heightAnchor.constraint(equalTo: field1.heightAnchor, constant: 0),
            // MARK: field 5
            field5.topAnchor.constraint(equalTo: field3.bottomAnchor, constant: margin),
            field5.leftAnchor.constraint(equalTo: view.leftAnchor, constant: margin),
            field5.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -margin/2),
            field5.heightAnchor.constraint(equalTo: field1.heightAnchor, constant: 0),
            // MARK: field 6
            field6.topAnchor.constraint(equalTo: field4.bottomAnchor, constant: margin),
            field6.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: margin/2),
            field6.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -margin),
            field6.heightAnchor.constraint(equalTo: field1.heightAnchor, constant: 0)])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        title = "Next ViewController"
        loadFields()
        setConstraints()
    }
    
}

#Preview {
    NextViewController()
}

