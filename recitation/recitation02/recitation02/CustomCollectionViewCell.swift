//
//  CustomCollectionViewCell.swift
//  recitation02
//
//  Created by Dmitry An on 20/11/2023.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var tap: ((UIImage) -> Void)?
    
    private var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
        imageView.image = UIImage(systemName: "person")
        addSubview(imageView) // можно без contentView  и тп
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        addGestureRecognizer(recognizer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func cellTap() {
        tap?(imageView.image ?? UIImage()) // возвращает картинку если она есть или пустую если ее нет тк tap опционал
    }
}
