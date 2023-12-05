//
//  ImageViewController.swift
//  Cities
//
//  Created by Dmitry An on 21/11/2023.
//

import UIKit

class ImageViewController: UIViewController {
    
    private var imageView = UIImageView()
    
    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = image
        title = "ImageViewController"
        view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        setupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animation()
        
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            imageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    private func animation() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            options: [.repeat, .autoreverse]) {
                self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi/4)
            }
        UIView.animate(
            withDuration: 3,
            delay: 0,
            options: [.repeat, .autoreverse]) {
                self.imageView.layer.opacity = 0
                
            }
    }
}

#Preview {
    ImageViewController(image: UIImage(systemName: "person")!)
}
