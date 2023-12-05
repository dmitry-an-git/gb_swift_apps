//
//  CustomCollectionCell.swift
//  Cities
//
//  Created by Dmitry An on 21/11/2023.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    var tap: ((UIImage) -> Void)?
    
    private var imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame:frame)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
        //imageView.image = UIImage(systemName: "person")
        imageView.getDog()
        //imageView.getDog()
        addSubview(imageView)
        let recogniser = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        addGestureRecognizer(recogniser)
        //imageView.getDog()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func cellTap() {
        tap?(imageView.image ?? UIImage())
    }
    
//    func setImage() {
//        imageView.getDog{ [weak self] image in
//            DispatchQueue.main.async {
//                self?.imageView.image = image
//            }
//        }
//    }
    
//    override func prepareForReuse() {
//        imageView.image = nil
//    }
    
    
//    func updateCell(model:Group) {
//        
//        title.text = model.name
//        subtitle.text = model.description
//        DispatchQueue.global().async {
//            if let url = URL(string: model.photo ?? "")
//                let data = try? Data(contentsOf: url) {
//                DispatchQueue.main.async {
//                    self.groupImageView.image = UIImage(data: data)
//                }
//            }
//                
//        }
//    }

}
