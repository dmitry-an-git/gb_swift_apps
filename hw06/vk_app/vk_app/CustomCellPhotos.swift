//
//  CustomCellPhotos.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

final class CustomCellPhotos: UICollectionViewCell {
    
    static let identifier = Constants.IDs.PhotoCell
    
    var tap: ((UIImage) -> Void)?
    
    private var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        imageView = UIImageView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: contentView.frame.size.width,
                height: contentView.frame.size.height
            )
        )
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        backgroundColor = Theme.currentTheme.backgroundColor
        
        let recogniser = UITapGestureRecognizer(
            target: self,
            action: #selector(cellTap)
        )
        addGestureRecognizer(recogniser)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(image: String) {
        imageView.image = UIImage(systemName: image)
    }
    
    @objc func cellTap() {
        tap?(imageView.image ?? UIImage())
    }
    
    override func prepareForReuse() {
        imageView.image = .none
        backgroundColor = Theme.currentTheme.backgroundColor
    }
    
    func configure(datapoint: PhotosDataModel.Response.Photo) {
        DispatchQueue.global().async {
            if let url = URL(string: datapoint.sizes[2].url ?? ""),
               let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}



#Preview {
    let cellPreview = CustomCellPhotos(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    cellPreview.setImage(image: "person.2")
    return cellPreview
}
