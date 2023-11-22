//
//  TableViewController.swift
//  recitation02
//
//  Created by Dmitry An on 20/11/2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.barTintColor = .white
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell
        
        guard let cell = cell else {
            return UITableViewCell()
        }
        
        cell.setLabel(text: "Row \(indexPath.row)")
        
        return cell
    }
}

#Preview {
    TableViewController()
}
