//
//  ViewController.swift
//  Nulp_App
//
//  Created by Ivan Sapiga on 02.09.2018.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func sayButton(_ sender: UIButton) {
        if (nameTextField.text?.isEmpty)! {
                    helloLabel.text = "Hello Friend"
        } else {
            helloLabel.text = "Hello \(nameTextField.text!))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello World:)")
    }
}
