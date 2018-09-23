//
//  TableVCViewController.swift
//  Nulp_App
//
//  Created by Ivan Sapiga on 17.09.2018.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit

class TableVCViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }

}

// MARK: - UITableViewDataSource

extension TableVCViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let placesArray = ViewController.getPlaces()
        return placesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableTableViewCell", for: indexPath) as! TableTableViewCell
        
        let placesArray = ViewController.getPlaces()
        let person = placesArray[indexPath.row]
        cell.configureWith(person: person)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension TableVCViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
}

