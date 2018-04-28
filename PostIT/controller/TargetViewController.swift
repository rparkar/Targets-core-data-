//
//  TargetViewController.swift
//  PostIT
//
//  Created by Rehan Parkar on 2018-04-27.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit
import CoreData

//publicly AV constant
let appDelegate = UIApplication.shared.delegate as? AppDelegate

class TargetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlets
    
    @IBOutlet weak var tableView: UITableView!
    var target : [Targets] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.fetch { (success) in
            
            if success {
                if target.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
        tableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "targetCell") as? TargetCell else {return UITableViewCell()}
        
        let targets = target[indexPath.row]
        cell.configureCell(targte: targets)
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return target.count
    }
    
    @IBAction func addTargetButtonPressed(_ sender: Any) {
    }
    
}

//fetchign core data

extension TargetViewController {
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let fetchRequest = NSFetchRequest<Targets>(entityName: "Targets")
        
        do {
            target = try managedContext.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint("\(error.localizedDescription)")
            completion(false)
        }
    }
}







