//
//  ViewController.swift
//  lecture02
//
//  Created by Dmitry An on 19/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height * 2)
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemBlue
        return label
    }()
    
    private let image: UIImageView = {
        let image = UIImage(systemName: "person.2")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Table View", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.setTitle("Table View Controller", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    let button3: UIButton = {
        let button = UIButton()
        button.setTitle("Collection View", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    let button4: UIButton = {
        let button = UIButton()
        button.setTitle("Collection View Controller", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(image)
        contentView.addSubview(label)
        contentView.addSubview(button)
        contentView.addSubview(button2)
        contentView.addSubview(button3)
        contentView.addSubview(button4)
        setConstraints()
        
        button.addTarget(
            self,
            action: #selector(goToTableView),
            for: .touchUpInside)
        
        button2.addTarget(
            self,
            action: #selector(goToTableViewController),
            for: .touchUpInside)
        
        button3.addTarget(
            self,
            action: #selector(goCollectionView),
            for: .touchUpInside)
    
        button4.addTarget(
            self,
            action: #selector(goCollectionViewControllerUI),
            for: .touchUpInside)
    }

    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30),
            image.widthAnchor.constraint(equalToConstant: 285),
            image.heightAnchor.constraint(equalToConstant: 183),
            
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 300),
            
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 100),
            
            button2.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button2.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -30),
            button2.widthAnchor.constraint(equalToConstant: 300),
            button2.heightAnchor.constraint(equalToConstant: 100),
            
            button3.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button3.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -30),
            button3.widthAnchor.constraint(equalToConstant: 300),
            button3.heightAnchor.constraint(equalToConstant: 100),
            
            button4.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            button4.bottomAnchor.constraint(equalTo: button3.topAnchor, constant: -30),
            button4.widthAnchor.constraint(equalToConstant: 300),
            button4.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func getLayout() -> UICollectionViewLayout {
        // ITEM: (1 image)
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        // GROUP: (1 line of 2 images, but can be a column as well)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(view.frame.size.width / 2)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        // SECTION
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}

private extension ViewController {
    
    @objc func goToTableView() {
        navigationController?.pushViewController(TableView(), animated: true)
        // present это показ модального окна - alert etc
    }
    
    @objc func goToTableViewController() {
        navigationController?.pushViewController(TableViewController(), animated: true)
    }
    
    @objc func goCollectionView() {
        navigationController?.pushViewController(CollectionView(), animated: true)
    }
    
    @objc func goCollectionViewControllerUI() {
        // navigationController?.pushViewController(CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()), animated: true)
        navigationController?.pushViewController(CollectionViewController(collectionViewLayout: getLayout()), animated: true)
    }
}

#Preview {
    ViewController()
}
