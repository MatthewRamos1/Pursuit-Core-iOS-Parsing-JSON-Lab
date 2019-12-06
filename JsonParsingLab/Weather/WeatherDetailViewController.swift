//
//  WeatherDetailViewController.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/4/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    
    var cityWeather : CityWeather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let cityWeatherData = cityWeather else {
            fatalError("Error: Couldn't pull CityWeather, check prepare segue")
        }
            cityLabel.text = cityWeather?.name
        weatherLabel.text = "\(cityWeatherData.weather.first?.main ?? "Error"), \(cityWeatherData.main.temp)"
        }
    }

