//
//  CustomCellFriends.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

final class CustomCellGroups: UITableViewCell {
    
    static let identifier = Constants.IDs.GroupCell
    
    private let groupPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(systemName: "person.2")
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
        label.textColor = Theme.currentTheme.fontColor
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "Even more dummy text"
        label.textColor = Theme.currentTheme.fontColor
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Theme.currentTheme.backgroundColor
        loadAll()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadAll() {
        contentView.addSubview(groupPhoto)
        contentView.addSubview(label)
        contentView.addSubview(label2)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            groupPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            groupPhoto.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            groupPhoto.heightAnchor.constraint(equalToConstant: 100),
            groupPhoto.widthAnchor.constraint(equalTo: groupPhoto.heightAnchor),
            groupPhoto.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            label.leftAnchor.constraint(equalTo: groupPhoto.rightAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: groupPhoto.topAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: groupPhoto.centerYAnchor, constant: -5),
            
            label2.leftAnchor.constraint(equalTo: groupPhoto.rightAnchor, constant: 20),
            label2.topAnchor.constraint(equalTo: groupPhoto.centerYAnchor, constant: 5),
            label2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
    override func prepareForReuse() {
        label.text = ""
        label2.text = ""
        groupPhoto.image = .none
        backgroundColor = Theme.currentTheme.backgroundColor
        label.textColor = Theme.currentTheme.fontColor
    }
    
    func configure(datapoint: GroupsDataModel.Response.Group) {
        
        label.text = datapoint.name ?? ""
        label2.text = datapoint.screenName ?? ""
    
        DispatchQueue.global().async {
            if let url = URL(string: datapoint.photo ?? ""),
                let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.groupPhoto.image = UIImage(data: data)
                }
            }
        }
    }
    
}

#Preview {
    CustomCellGroups()
}

