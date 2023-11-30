//
//  TabBarController.swift
//  test2
//
//  Created by Dmitry An on 29/11/2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var data = [City]()
    private let networkSevice = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        networkSevice.getCities() { [weak self] cities in
            self?.data = cities
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: CustomTableViewCell.identifier,
            for: indexPath
        ) as? CustomTableViewCell
        
        guard let cell else {
            return UITableViewCell()
        }
        
        let dataPoint: City = data[indexPath.row]
        cell.configureCell(
            title: dataPoint.name,
            currency: dataPoint.currency,
            timeZone: dataPoint.timeZone
        )
        return cell
    }

}

#Preview {
    TableViewController()
}
