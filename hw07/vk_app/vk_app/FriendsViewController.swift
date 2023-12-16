//
//  TableViewController.swift
//  not_storyboard
//
//  Created by Dmitry An on 22/11/2023.
//

import UIKit

protocol ViewControllerProtocol: AnyObject {
    func askInteractorForData()
    func loadDataFromPresenter(data: [FriendsDataModel.Response.Friend])
    func endRefreshing()
    func showAlert(date: String)
    func notifyInteractorOnFirstLoad()
}

final class FriendsViewController: UITableViewController, ProfileViewDelegate, ViewControllerProtocol {
    
    private var interactor: InteractorProtocol
    private var data: [FriendsDataModel.Response.Friend] = []
    private var profileViewController: ProfileViewControllerProtocol
    
    init(interactor: InteractorProtocol) {
        self.interactor = interactor
        self.profileViewController = ProfileViewController(isOwner: true)
        super.init(nibName: nil, bundle: nil)
        profileViewController.setDelegate(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        tableView.backgroundColor = CurrentTheme.currentTheme.backgroundColor
        tableView.register(
            CustomCellFriends.self,
            forCellReuseIdentifier: CustomCellFriends.identifier
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Profile",
            style: .plain,
            target: self,
            action: #selector(rightBarButtonTapped)
        )
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(
            self,
            action: #selector(askInteractorForData),
            for: .valueChanged
        )
        
        notifyInteractorOnFirstLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: CurrentTheme.currentTheme.fontColor]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellFriends.identifier, for: indexPath) as? CustomCellFriends else {
            return UITableViewCell()
        }
        
        cell.configure(datapoint: data[indexPath.row])
        
        cell.tap = {[weak self] name, photoHQUrl in
            print(name)
            print(photoHQUrl)
            self?.navigationController?.pushViewController(
                ProfileViewController(
                    name: name,
                    photoHQUrl: photoHQUrl),
                animated: true)
        }
        
        return cell
    }
}

extension FriendsViewController {
    
    @objc func rightBarButtonTapped() {

        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 1.5
        animation.type = .fade
        
        self.navigationController?.view.layer.add(animation, forKey: nil)
           
        navigationController?.pushViewController(profileViewController, animated: false)
    }
    
    func showAlert(date: String) {

        let alert = UIAlertController(
            title: "Error while loading the data",
            message: "The cached data is as of \(date)",
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "Close",
                style: .default,
                handler: nil
            )
        )
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func loadDataFromPresenter(data: [FriendsDataModel.Response.Friend]) {
        self.data = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func notifyInteractorOnFirstLoad() {
        interactor.firstLoadConfigure()
    }
    
    @objc func askInteractorForData() {
        interactor.updateData()
    }
    
    func endRefreshing() {
        DispatchQueue.main.async {
            self.refreshControl?.endRefreshing()
        }
    }
    
    func updateTheme() {
        tableView.backgroundColor = CurrentTheme.currentTheme.backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: CurrentTheme.currentTheme.fontColor]
    }
    
}
