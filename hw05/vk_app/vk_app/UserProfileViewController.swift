//
//  UserProfileViewController.swift
//  vk_app
//
//  Created by Dmitry An on 02/12/2023.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    private let userPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(systemName: "person")
        photo.layer.cornerRadius = 10
        photo.backgroundColor = .systemGray6
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Some dummy name"
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        view.backgroundColor = .white
        view.addSubview(userPhoto)
        view.addSubview(label)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userPhoto.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            userPhoto.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            userPhoto.heightAnchor.constraint(equalTo: userPhoto.widthAnchor),
            
            label.topAnchor.constraint(equalTo: userPhoto.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func configure() {
        
        NetworkService().getData(request: .user) { [weak self] userData in
            guard let userData = userData as? UserDataModel else {
                print("wrong type")
                return }
            
            let firstName = userData.response[0].firstName ?? ""
            let lastName = userData.response[0].lastName ?? ""
            
            DispatchQueue.main.async {
                self?.label.text = firstName + " " + lastName
            }
            
            if let url = URL(string: userData.response[0].photoUrl ?? ""),
               let imgData = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self?.userPhoto.image = UIImage(data: imgData)
                }
            }
        }
    }
}

#Preview {
    UserProfileViewController()
}
