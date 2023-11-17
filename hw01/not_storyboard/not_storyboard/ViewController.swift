//
//  ViewController.swift
//  not_storyboard
//
//  Created by Dmitry An on 16/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    let image: UIImageView = {
        let image = UIImage(systemName: "person.2")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Autorisation"
        titleLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold) // Large title style
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    /*
    let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = "Login:"
        loginLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular) // Large title style
        loginLabel.textColor = .black
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        return loginLabel
    }()
    
    let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        passwordLabel.text = "Password:"
        passwordLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular) // Large title style
        passwordLabel.textColor = .black
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordLabel
    }()
     */
    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Enter your login"
        loginTextField.borderStyle = .roundedRect
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        return loginTextField
    }()
    
    let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Enter your password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()
    

    private func loadObjects() {
        view.addSubview(image)
        view.addSubview(titleLabel)
        //view.addSubview(loginLabel)
        //view.addSubview(passwordLabel)
        view.addSubview(button)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
    
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.widthAnchor.constraint(equalToConstant: 285),
            image.heightAnchor.constraint(equalToConstant: 183),
            
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.widthAnchor.constraint(equalToConstant: 300),

            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 30),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
    
            button.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 60),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadObjects()
        addConstraints()
        

        // Do any additional setup after loading the view.
    }
    
}

#Preview {
    ViewController()
}

