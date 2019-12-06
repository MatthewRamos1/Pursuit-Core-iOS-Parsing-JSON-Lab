//
//  ViewController.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/4/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var weatherData = [CityWeather]()
    var filename = "weatherData"
    var ext = "json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        let data = Bundle.readJSONData(filename: filename, ext: ext)
        weatherData = WeatherData.getWeather(from: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherDetailViewController = segue.destination as? WeatherDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error with preparing segue")
        }
        weatherDetailViewController.cityWeather = weatherData[indexPath.row]
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell" , for: indexPath)
        let cityWeather = weatherData[indexPath.row]
        cell.textLabel?.text = cityWeather.name
        return cell

    }
}
