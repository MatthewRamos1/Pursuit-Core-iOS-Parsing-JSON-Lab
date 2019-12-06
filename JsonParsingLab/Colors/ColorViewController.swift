//
//  ColorViewController.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/5/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colorData = [Color]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        let data = Bundle.readJSONData(filename: "colorData", ext: "json")
        colorData = Color.getColors(data: data)
        

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorDetailViewController = segue.destination as? ColorDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error with preparing segue")
        }
        colorDetailViewController.color = colorData[indexPath.row]
        }
    }



extension ColorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let color = colorData[indexPath.row]
        cell.textLabel?.text = color.name
        dump(color)
        cell.backgroundColor = color.UIColorMaker()
        return cell
    }

    
}
