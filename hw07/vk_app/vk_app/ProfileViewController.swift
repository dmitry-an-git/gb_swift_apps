//
//  UserProfileViewController.swift
//  vk_app
//
//  Created by Dmitry An on 02/12/2023.
//

import UIKit

protocol ProfileViewDelegate: UIViewController {
    func updateTheme()
}

protocol ProfileViewControllerProtocol: UIViewController {
    func setDelegate(delegate: ProfileViewDelegate)
    func updateDelegateTheme()
}

class ProfileViewController: UIViewController, ThemeViewDelegate, ProfileViewControllerProtocol {
    
    weak var delegate: ProfileViewDelegate?
    private var isOwner: Bool
    private var themeView: ThemeViewProtocol
    
    private let userPhoto: UIImageView = {
        let photo = UIImageView()
        photo.contentMode = .scaleAspectFill
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

    init(name: String? = nil, photo: UIImage? = nil, isOwner: Bool) {
        self.isOwner = isOwner
        self.themeView = ThemeView()
        super.init(nibName: nil, bundle: nil)
        themeView.setDelegate(delegate: self)
        label.text = name
        userPhoto.image = photo
    }
    
    init(name: String, photoHQUrl: String) {
        self.isOwner = false
        self.themeView = ThemeView()
        super.init(nibName: nil, bundle: nil)
        themeView.isHidden = true
        label.text = name
        loadFriendPhotoHQ(url: photoHQUrl)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        if isOwner { configureOwnerProfile() }
        view.backgroundColor = CurrentTheme.currentTheme.backgroundColor
        view.addSubview(userPhoto)
        view.addSubview(label)
        view.addSubview(themeView)
        setConstraints()
    }
    
    private func setConstraints() {
        themeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userPhoto.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            userPhoto.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            userPhoto.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            userPhoto.heightAnchor.constraint(equalTo: userPhoto.widthAnchor),
            
            label.topAnchor.constraint(equalTo: userPhoto.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 30),
            
            themeView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            themeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            themeView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            themeView.heightAnchor.constraint(equalToConstant: 320)
        ])
    }
    
    func setDelegate(delegate: ProfileViewDelegate) {
        self.delegate = delegate
    }
    
    func updateDelegateTheme() {
        view.backgroundColor = CurrentTheme.currentTheme.backgroundColor
        delegate?.updateTheme()
        // MARK: without explicit updating the delagate its navigation menu does not change the color
    }
    
    func loadFriendPhotoHQ(url: String?) {
        DispatchQueue.global().async {
            if let url = URL(string: url ?? ""),
               let imgData = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.userPhoto.image = UIImage(data: imgData)
                }
            }
        }
    }
    
    func configureOwnerProfile() {
        NetworkService().getData(request: .user) { [weak self] result in
            switch result {
            case .success(let userData):
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

            case .failure:
                print("Error loading user info")
            }
        }

    }
}
