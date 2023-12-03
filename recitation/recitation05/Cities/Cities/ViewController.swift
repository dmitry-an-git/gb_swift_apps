//
//  ViewController.swift
//  Cities
//
//  Created by Dmitry An on 15/11/2023.
//

import UIKit

final class ViewController: UIViewController {
    
   
    
    private var isColorChanged = false
    private let label: UILabel = {
        let label = UILabel()
        //label.frame = CGRect(x: 100, y: 100, width: 400, height: 400) // это фрейм
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "my first app"
        label.textColor = .white
        label.backgroundColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    // Can be done like this because of closure: {functions}()
    private let button: UIButton = {
        $0.setTitle("switch to new screen", for: .normal)
        $0.backgroundColor = .blue
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitleColor(.green, for: .highlighted)
        return $0
    }(UIButton())
    
    private let button2: UIButton = {
        let button = UIButton()
        button.setTitle("change screen color", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.green, for: .highlighted)
        return button
    }()
    
    private let button3 = CustomButton(text: "Перейти на TableViewController")
    private let button4 = CustomButton(text: "Перейти на CollectionViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
    
        
        // Реализовать экран, представленный на картинке. Реализовывать во ViewController(). Использовать констрейнты
        // настройку ограничений делаем во вьюдидлоад тк надо чтобы наш вью уже был сформирован для решения уравнения и только после того как сабвью уже был добавлен во вью
        
        addElements()
        setConstraints()
        
        button.addTarget(self, action: #selector(goToNextController), for: .touchUpInside)
        button2.addTarget(self, action: #selector(changeScreenColor), for: .touchUpInside)
        button3.addTarget(self, action: #selector(goToTableViewController), for: .touchUpInside)
        button4.addTarget(self, action: #selector(goToCollectionViewController), for: .touchUpInside)
        
        // в селекторе функция обджектив си -> без аргументов
    }
    
    private func addElements() {
        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10), // maybe bottomAnchor as well
            label.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            label.heightAnchor.constraint(equalToConstant: 200),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            button.heightAnchor.constraint(equalToConstant: 100),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
            button2.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            button2.heightAnchor.constraint(equalToConstant: 100),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            button3.heightAnchor.constraint(equalToConstant: 100),
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 20),
            button4.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            button4.heightAnchor.constraint(equalToConstant: 100)
            // can be also right / left or leading / trailing
        ])
    }
}

// objective-c methods

private extension ViewController {
    @objc func goToNextController() {
        navigationController?.pushViewController(NextViewController(), animated: true)
        // present это показ модального окна - alert etc
        // present(NextViewController, animated: true)
    }
    
    @objc func changeScreenColor() {
        
        view.backgroundColor = isColorChanged ? .cyan : .yellow
        isColorChanged.toggle()
    }
    
    @objc func goToTableViewController() {
        
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    @objc func goToCollectionViewController() {
        
        navigationController?.pushViewController(CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)

    }
    
}

#Preview {
    ViewController()
}

