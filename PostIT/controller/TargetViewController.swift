//
//  TargetViewController.swift
//  PostIT
//
//  Created by Rehan Parkar on 2018-04-27.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "targetCell") as? TargetCell else {return UITableViewCell()}
        
        cell.configureCell(description: "Clean my pad", termType: .longTerm, targetAmount: 2)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    @IBAction func addTargetButtonPressed(_ sender: Any) {
    }
    
}
