//
//  TableTableViewCell.swift
//  Nulp_App
//
//  Created by Ivan Sapiga on 16.09.2018.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit

class TableTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        print(ViewController.getPlaces())
//        var placeArray = (ViewController.getPlaces())
//        // Initialization code
//        firstNameLabel.text = placeArray[0].firstName;
//        secondNameLabel.text = placeArray[0].secondName;
//        phoneNumberLabel.tag = placeArray[0].phoneNumber;
//        print(placeArray[0].firstName)
//    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        firstNameLabel.text = ""
        secondNameLabel.text = ""
        phoneNumberLabel.text = ""
    }
    
    func configureWith(person: Person) {
        firstNameLabel.text = "Name: \(person.firstName)"
        secondNameLabel.text = "Second Name: \(person.secondName)"
        phoneNumberLabel.text = "Phone: \(person.phoneNumber)"
    }

}
