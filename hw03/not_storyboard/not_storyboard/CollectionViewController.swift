//
//  CollectionViewController.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

final class CollectionViewController: UICollectionViewController {
    
    private let images = ["house", "bell", "person.circle", "star", "airplane", "gear"]
    // i use system images as i dont know how to use actual photos
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
                return
            }
        let width = (collectionView.frame.size.width - layout.minimumInteritemSpacing - 50) / 2
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        
        view.backgroundColor = .white
        setConstraints()
        
        collectionView.register(CustomCellPhotos.self, forCellWithReuseIdentifier: "cell")
        title = "Photos"
        
        NetworkService().getData(request: .photos)
    }
    
    private func setConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10)
        ])
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        guard let collectionViewCell = collectionViewCell as? CustomCellPhotos else {
            return UICollectionViewCell()
        }
        
        collectionViewCell.setImage(image: images[indexPath.item])
        
        collectionViewCell.tap = {[weak self] image in
            self?.navigationController?.pushViewController(ImageViewController(image: image), animated: true)
        }

        return collectionViewCell
    }
    
}

#Preview {
    CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
}
