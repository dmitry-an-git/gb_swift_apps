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
        imageView.image = UIImage(systemName: "person")
        addSubview(imageView)
        let recogniser = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        addGestureRecognizer(recogniser)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func cellTap() {
        tap?(imageView.image ?? UIImage())
    }
    
//    override func prepareForReuse() {
//        imageView.image = nil
//    }
}
