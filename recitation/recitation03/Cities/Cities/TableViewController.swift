//
//  TableViewController.swift
//  Cities
//
//  Created by Dmitry An on 21/11/2023.
//

import UIKit

class TableViewController: UITableViewController { 
    

    private var networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        tableView.backgroundColor = .red
        //navigationController?.navigationBar.tintColor = .black
        //navigationController?.navigationBar.barTintColor = .green
        title = "TableViewController"
        //networkService.getData()
        //networkService.getNews()
        //networkService.getPlaces()
        //networkService.getMovies()
        //networkService.getDog()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
     
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        CustomTableCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section \(section + 1)"
    }
}

#Preview {
    TableViewController()
}
