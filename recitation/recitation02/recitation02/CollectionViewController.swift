//
//  CollectionViewController.swift
//  recitation02
//
//  Created by Dmitry An on 20/11/2023.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        title = "Collection View Controller"
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    
    private func setConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10)
        ])
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        18
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        guard let collectionViewCell = collectionViewCell as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        collectionViewCell.tap = { [weak self] image in
            self?.navigationController?.pushViewController(ViewController(), animated: true)  // [weak self] is to avoid strong capture of collection view controller in the closure
        }
        return collectionViewCell
    }
    
}


extension CollectionViewController {
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
}

#Preview {
    CollectionViewController(collectionViewLayout:
                                UICollectionViewFlowLayout())
}
