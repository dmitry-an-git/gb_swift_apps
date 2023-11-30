//
//  TableViewController.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

final class FirstTableViewController: UITableViewController {
    
    private var data = [FriendsDataModel.Response.Friend]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(
            CustomCellFriends.self,
            forCellReuseIdentifier: CustomCellFriends.identifier
        )
        title = "Friends"
        
        NetworkService().getData(request: .friends) { [weak self] friends in
            guard let friends = friends as? FriendsDataModel else { return }
            self?.data = friends.response.items
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "First"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellFriends.identifier, for: indexPath) as? CustomCellFriends else {
            return UITableViewCell()
        }
        
        cell.configure(datapoint: data[indexPath.row])
        
        return cell
    }
    
    //    func updateCell(model:Group) {
    //
    //        title.text = model.name
    //        subtitle.text = model.description
    //        DispatchQueue.global().async {
    //            if let url = URL(string: model.photo ?? "")
    //                let data = try? Data(contentsOf: url) {
    //                DispatchQueue.main.async {
    //                    self.groupImageView.image = UIImage(data: data)
    //                }
    //            }
    //
    //        }
    //    }
}

#Preview {
    FirstTableViewController()
}
