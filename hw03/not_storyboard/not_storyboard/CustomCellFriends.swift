//
//  CustomCellFriends.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit 

final class CustomCellFriends: UITableViewCell {
    
    private let friendPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(systemName: "person")
        photo.layer.cornerRadius = 10
        photo.backgroundColor = .systemGray6
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        return photo
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Some dummy text"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loadAll()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadAll() {
        contentView.addSubview(friendPhoto)
        contentView.addSubview(label)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            friendPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            friendPhoto.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            friendPhoto.heightAnchor.constraint(equalToConstant: 100),
            friendPhoto.widthAnchor.constraint(equalTo: friendPhoto.heightAnchor),
            friendPhoto.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            label.leftAnchor.constraint(equalTo: friendPhoto.rightAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: friendPhoto.centerYAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
}

#Preview {
    CustomCellFriends()
}

