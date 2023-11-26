//
//  CustomTableCell.swift
//  Cities
//
//  Created by Dmitry An on 21/11/2023.
//

import UIKit 

class CustomTableCell: UITableViewCell{

    private let label1 = CustomLabel("first")
    private let label2 = CustomLabel("second")
    private let label3 = CustomLabel("third")
    
    private let roundLabel: UIView = {
        let label = UIView()
        label.backgroundColor = .systemCyan
        //label.tintColor = .black
        label.layer.cornerRadius = 50
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(roundLabel)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            roundLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            roundLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            roundLabel.heightAnchor.constraint(equalToConstant: 100),
            roundLabel.widthAnchor.constraint(equalTo: roundLabel.heightAnchor),
            roundLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            label1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label1.leftAnchor.constraint(equalTo: roundLabel.rightAnchor, constant: 10),
            label1.heightAnchor.constraint(equalTo: roundLabel.heightAnchor, multiplier: 0.3),
            label1.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),

            label2.centerYAnchor.constraint(equalTo: roundLabel.centerYAnchor),
            label2.leftAnchor.constraint(equalTo: roundLabel.rightAnchor, constant: 10),
            label2.heightAnchor.constraint(equalTo: roundLabel.heightAnchor, multiplier: 0.3),
            label2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),

            //label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            label3.leftAnchor.constraint(equalTo: label2.leftAnchor),
            label3.heightAnchor.constraint(equalTo: roundLabel.heightAnchor, multiplier: 0.3),
            label3.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
}
#Preview {
    CustomTableCell()
}
