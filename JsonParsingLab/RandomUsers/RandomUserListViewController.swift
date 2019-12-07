//
//  RandomUserListViewController.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/6/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class RandomUserListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var randomUserData = [RandomUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let data = Bundle.readJSONData(filename: "randomUserData", ext: "json")
        randomUserData = RandomUserData.getUsers(data: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let randomUserDetailController = segue.destination as? RandomUserDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error with preparing segue")
        }
        randomUserDetailController.user = randomUserData[indexPath.row]
        }
}



extension RandomUserListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        randomUserData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = randomUserData[indexPath.row]
        cell.textLabel?.text = user.name.title + ". " + user.name.first + " " + user.name.last
        cell.detailTextLabel?.text = user.email
        return cell
    }
    
}
