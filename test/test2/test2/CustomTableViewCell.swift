//
//  CustomTableViewCell.swift
//  test2
//
//  Created by Dmitry An on 29/11/2023.
//

import UIKit 

class CustomTableViewCell: UITableViewCell{

    static let identifier = "cell"
    
    private var label1 = CustomLabel(text: "label1")
    private var label2 = CustomLabel(text: "label2")
    private var label3 = CustomLabel(text: "label3")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.backgroundColor = .cyan
        setConstraints()
        //contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //label1
            label1.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label1.heightAnchor.constraint(equalToConstant: 50),
            //label2
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
            label2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label2.heightAnchor.constraint(equalToConstant: 50),
            //label3
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            label3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label3.heightAnchor.constraint(equalToConstant: 50),
            contentView.bottomAnchor.constraint(equalTo: label3.bottomAnchor, constant: 10)
        ])
    }
    
    func configureCell(title: String, currency: String?, timeZone: String?) {
        label1.text = title
        label2.text = currency ?? "no data"
        label3.text = timeZone ?? "no data"
    }
    
}

#Preview {
    CustomTableViewCell()
}
