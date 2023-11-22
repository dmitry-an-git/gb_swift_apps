//
//  CustomTableViewCellStackView.swift
//  lecture02
//
//  Created by Dmitry An on 20/11/2023.
//

import UIKit 

class CustomTableViewCellStackView: UITableViewCell {
    
    private let label:UILabel = {
        let label = UILabel()
        label.text = "First"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label1:UILabel = {
        let label = UILabel()
        label.text = "Second"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label2:UILabel = {
        let label = UILabel()
        label.text = "Third"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var stackView: UIStackView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        stackView = UIStackView(arrangedSubviews: [label, label1, label2])
        stackView.backgroundColor = .white
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBlue
        
        setupStackView()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.setCustomSpacing(10, after: label)
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 10),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    
    override func prepareForReuse() {
// removes checkmarks from the first usage of the cell if any
        super.prepareForReuse()
        accessoryType = .none
    }
    
    
    func setLabel(text: String) {
        label.text = text
    }
    
}

#Preview {
    CustomTableViewCellStackView(style: .default, reuseIdentifier: "cell")
}
