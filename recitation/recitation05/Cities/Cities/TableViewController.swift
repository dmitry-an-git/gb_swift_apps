//
//  TableViewController.swift
//  Cities
//
//  Created by Dmitry An on 21/11/2023.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
    
    private var data = [City]()
    
    private let networkService = NetworkService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.backgroundColor = .red
        tableView.register(
            CustomTableViewCell.self,
            forCellReuseIdentifier: CustomTableViewCell.identifier
        )
        
        networkService.getCities {[weak self] cities in
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
        
        let dataPoint = data[indexPath.row]
    
        cell.setupCell(
            name: dataPoint.name,
            lat: dataPoint.coords.lat,
            lon: dataPoint.coords.lon,
            timezone: dataPoint.timezone,
            currency: dataPoint.currency
        )
//        
        return cell
    }
    
}

#Preview {
    TableViewController()
}
