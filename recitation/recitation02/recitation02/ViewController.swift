//
//  ViewController.swift
//  recitation02
//
//  Created by Dmitry An on 20/11/2023.
//

import UIKit

class ViewController: UIViewController {

    private var label1: UILabel = {
        let label = UILabel()
        label.text = "Text!"
        label.textAlignment = .center
        label.backgroundColor = .green
        return label
    }()
    
    private var button1 = CustomButton(text: "Переход 1")
    private var button2 = CustomButton(text: "Переход 2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(label1)
        view.addSubview(button1)
        view.addSubview(button2)
        setupConstraints()
        
        button1.addTarget(self, action: #selector(goToView1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(goToView2), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }

    private func setupConstraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            label1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label1.heightAnchor.constraint(equalToConstant: 50),
            label1.widthAnchor.constraint(equalToConstant: 300),
            
            button1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 30),
            button1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button1.heightAnchor.constraint(equalToConstant: 50),
            button1.widthAnchor.constraint(equalToConstant: 300),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 30),
            button2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button2.heightAnchor.constraint(equalToConstant: 50),
            button2.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension ViewController {
    
    @objc func goToView1() {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    @objc func goToView2() {
        navigationController?.pushViewController(CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
    }
}

#Preview {
    ViewController()
}
