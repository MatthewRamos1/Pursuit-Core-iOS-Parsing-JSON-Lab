//
//  ColorDetailViewController.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/6/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {

    @IBOutlet weak var hexValueLabel: UILabel!
    @IBOutlet weak var rgbValuesLabel: UILabel!
    
    var color: Color?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI () {
        guard let detailVCColor = color else {
            fatalError("Error: Couldn't pull Color, check prepare segue")
        }
        hexValueLabel.text = color?.hexString
        rgbValuesLabel.text = "R: \(detailVCColor.rgb.r), G: \(detailVCColor.rgb.g), B: \(detailVCColor.rgb.b)"
        
    }
    

}
