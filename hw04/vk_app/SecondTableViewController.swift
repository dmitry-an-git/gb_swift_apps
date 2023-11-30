//
//  TableViewController.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

final class SecondTableViewController: UITableViewController {
    
    private var data = [GroupsDataModel.Response.Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(
            CustomCellGroups.self,
            forCellReuseIdentifier: CustomCellGroups.identifier
        )
        title = "Groups"
        
        NetworkService().getData(request: .groups) { [weak self] groups in
    
            guard let groups = groups as? GroupsDataModel else {
                return
            }
            self?.data = groups.response.items
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellGroups.identifier, for: indexPath) as? CustomCellGroups else {
            return UITableViewCell()
        }
        
        cell.configure(datapoint: data[indexPath.row])
        
        return cell
    }
    

    
}

#Preview {
    SecondTableViewController()
}
