//
//  CollectionViewController.swift
//  Cities
//
//  Created by Dmitry An on 21/11/2023.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: Constants.IDs.CellID)
        view.backgroundColor = .systemBlue
        setConstraints()
        title = "CollectionViewController"

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
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.IDs.CellID, for: indexPath)
        
        guard let collectionViewCell = collectionViewCell as? CustomCollectionCell else {
            return UICollectionViewCell()
        }
        collectionViewCell.tap = {[weak self] image in
            self?.navigationController?.pushViewController(ImageViewController(image: image), animated: true)
        } // self? тк это weak self; [a,b] - будут захвачены в замыкание, image - параметр замыкания
        
        return collectionViewCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    
}

#Preview {
    CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
}
