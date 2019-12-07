//
//  RandomUserDetailViewController.swift
//  JsonParsingLab
//
//  Created by Matthew Ramos on 12/6/19.
//  Copyright © 2019 Matthew Ramos. All rights reserved.
//

import UIKit

class RandomUserDetailViewController: UIViewController {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var DOBLabel: UILabel!
    
    var user: RandomUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

    }
    
    func updateUI() {
        guard let detailVCUser = user else {
            fatalError("Error: Couldn't pull RandomUser, check prepare segue")
        }
        addressLabel.text = String(detailVCUser.location.street.number) + " " + detailVCUser.location.street.name + ", " + detailVCUser.location.city + ", " +
            detailVCUser.location.state + ", " + detailVCUser.location.country
        phoneNumLabel.text = detailVCUser.phone
        DOBLabel.text = detailVCUser.dob.date
    }


}
