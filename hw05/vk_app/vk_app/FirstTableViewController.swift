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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(rightBarButtonTapped))
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
    
}

extension FirstTableViewController {
    
    @objc func rightBarButtonTapped() {

        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 1.5
        animation.type = .fade
        
        self.navigationController?.view.layer.add(animation, forKey: nil)
        
        let newViewController = UserProfileViewController()
        
        navigationController?.pushViewController(newViewController, animated: false)
    }
    
}

#Preview {
    FirstTableViewController()
}
