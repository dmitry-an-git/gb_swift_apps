//
//  NewViewController.swift
//  lecture02
//
//  Created by Dmitry An on 19/11/2023.
//

import UIKit

class TableView: UIViewController {
    
    private var tableView = UITableView()
    
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        view.backgroundColor = .systemBlue
        tableView.backgroundColor = .white
        tableView.dataSource = self // it takes the data from itself
        setConstraints()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
// for cell with name "cell" create an instance of CustomTableViewCell class
    }
    


    
}

extension TableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
      
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
//        cast to CUstomTableViewCell? to make its functions available
        guard let cell = cell else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            cell.accessoryType = .checkmark
        }
//        will created several checkmarks, as long as the cells are reused
        
        cell.setLabel(text: "Row \(indexPath.row)")

        
        return cell
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
//        cell.textLabel?.text = "Hello"
//        cell.imageView?.image = UIImage(systemName: "person.2")
//        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat? {
        100
    }
}

#Preview {
    TableView()
}
