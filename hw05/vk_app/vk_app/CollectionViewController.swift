//
//  CollectionViewController.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

final class CollectionViewController: UICollectionViewController {
    
    private var data = [PhotosDataModel.Response.Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
                return
            }
        let width = (collectionView.frame.size.width - layout.minimumInteritemSpacing - 40) / 2
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        
        view.backgroundColor = .white
        setConstraints()
        
        collectionView.register(
            CustomCellPhotos.self,
            forCellWithReuseIdentifier: CustomCellPhotos.identifier
        )
        title = "Photos"
        
        NetworkService().getData(request: .photos) { [weak self] photos in
            guard let photos = photos as? PhotosDataModel else { return }
            self?.data = photos.response.items
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }

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
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCellPhotos.identifier,
            for: indexPath
        )
        
        guard let collectionViewCell = collectionViewCell as? CustomCellPhotos else {
            return UICollectionViewCell()
        }
        
        collectionViewCell.configure(datapoint: data[indexPath.row])
        
        collectionViewCell.tap = {[weak self] image in
            self?.navigationController?.pushViewController(ImageViewController(image: image), animated: true)
        }
        return collectionViewCell
    }
}

#Preview {
    CollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
}
