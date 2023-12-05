//
//  UserProfileViewController.swift
//  vk_app
//
//  Created by Dmitry An on 02/12/2023.
//

import UIKit

class ProfileViewController: UIViewController, ThemeViewDelegate {
    
    weak var delegate: UIViewController?
    private var isOwner: Bool
    private let themeView = ThemeView()
    
    
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

    init(name: String? = nil, photo: UIImage? = nil, isOwner: Bool) {
        self.isOwner = isOwner
        super.init(nibName: nil, bundle: nil)
        label.text = name
        userPhoto.image = photo
        themeView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        if isOwner {
            configure()
        } else {
            themeView.isHidden = true
        }
        
        view.backgroundColor = Theme.currentTheme.backgroundColor
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
    
    func updateColor() {
        view.backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.view.backgroundColor = Theme.currentTheme.backgroundColor
        // we do this to update the elder view (ie friends) in background mode
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.currentTheme.fontColor]
    }
    
    func configure() {
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

            case .failure(_):
                print("Error loading user info")
            }
        }

    }
}

#Preview {
    ProfileViewController(isOwner: true)
}
