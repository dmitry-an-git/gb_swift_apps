//
//  CustomTableViewCell.swift
//  lecture02
//
//  Created by Dmitry An on 19/11/2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    
    private let label:UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func prepareForReuse() {
// removes checkmarks from the first usage of the cell if any
        super.prepareForReuse()
        accessoryType = .none
    }
    
    private func setupView() {
        contentView.addSubview(label)
// contentView is a property of the cell that serves as the main container for the content you display in the cell.
// The contentView is a UIView that occupies the entire bounds of the cell. 
// You should add your custom views and controls as subviews of contentView rather than directly to the cell itself.
// contentView is a designated container view in each UITableViewCell where you add and layout the custom content of the cell. 
        setConstraints()
    }
    
    func setLabel(text: String) {
        label.text = text
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    
    // у ячейки нет методов жизненного цикла поэтому переопределяем инициализатор
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    CustomTableViewCell(style: .default, reuseIdentifier: "cell")
}
