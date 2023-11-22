//
//  TableViewController.swift
//  lecture02
//
//  Created by Dmitry An on 20/11/2023.
//

import UIKit

class TableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TableViewController"
        tabBarItem.title = "Table VC"
        view.backgroundColor = .systemBlue
        tableView.register(CustomTableViewCellStackView.self, forCellReuseIdentifier: "cell") // it can be just CustomTableViewCell
    }
}

extension TableViewController {
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCellStackView
        guard let cell = cell else {
            return UITableViewCell()
        }
        
        if indexPath.row == 0 {
            cell.accessoryType = .checkmark
        }
        cell.setLabel(text: "Row \(indexPath.row)")
     
        return cell

    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section \(section + 1)"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
        // Return the number of rows for the section
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Optional: Return the number of sections, default is 1
        return 3
    }
}

#Preview {
    TableViewController()
}
