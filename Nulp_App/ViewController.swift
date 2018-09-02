//
//  ViewController.swift
//  Nulp_App
//
//  Created by Ivan Sapiga on 02.09.2018.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var TextField: UITextField!
    @IBAction func sayButton(_ sender: UIButton) {
        if (TextField.text?.isEmpty)! {
                    Label.text = "Hello Friend"
        }else{
            Label.text = "Hello \(String(describing: TextField.text!))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

