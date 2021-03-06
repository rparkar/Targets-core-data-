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
public var someValue = false

class TargetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var undoDeleteView: UIView!
    
    //variables
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
        fetchCoreDataData()
        tableView.reloadData()

    }

    func fetchCoreDataData() {
        self.fetch { (success) in
            
            if success {
                if target.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "targetCell") as? TargetCell else {return UITableViewCell()}
        
        let targets = target[indexPath.row]
        cell.configureCell(targte: targets)
        
        someValue = false
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return target.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction  = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            
            let deleteTarget = UIAlertController(title: "CONFIRM", message: "Are you sure you want to delete? You can not undo this action", preferredStyle: .alert)
            
            let cancelAlert = UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
            let deleteTargetAlert = UIAlertAction(title: "DELETE", style: .destructive) { (action) in
                
                self.removeData(indexPath: indexPath)
                self.fetchCoreDataData()
                tableView.deleteRows(at: [indexPath], with: .automatic)
                self.undoDeleteView.isHidden = false
            }
            
            deleteTarget.addAction(cancelAlert)
            deleteTarget.addAction(deleteTargetAlert)
            
            self.present(deleteTarget, animated: true,completion: nil)
            
    
            //remove

        }
        
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        

        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.07594997436, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        return [deleteAction, addAction]
        
    }
    
    @IBAction func addTargetPressed(_ sender: Any) {
        performSegue(withIdentifier: "createTargetVC", sender: nil)
    }
    
    
    
    @IBAction func undoButtonPressed(_ sender: Any) {
        
//        undoDelete()
//        undoDeleteView.isHidden = true
        
    }
    
    @IBAction func closeUndoViewButtonPressed(_ sender: Any) {
        undoDeleteView.isHidden = true
    }
    
    
}

//fetching and deleting core data

extension TargetViewController {
//
//    func undoDelete() {
//
//        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
//        managedContext.undo()
//
//        managedContext.refreshAllObjects()
//
//       do {
//        try managedContext.save()
//        fetchCoreDataData()
//        tableView.reloadData()
//
//       } catch {
//          debugPrint("\(error.localizedDescription)")
//       }
//
//    }
    
    func setProgress(atIndexPath indexpath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let choosenTarget = target[indexpath.row]
        
        if choosenTarget.targetProgressValue < choosenTarget.targetCompletionValue {
        
            choosenTarget.targetProgressValue += 1
            
        } else {return}
        
        do {
            try managedContext.save()
        } catch {
            debugPrint("\(error.localizedDescription)")
        }
    }
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
    
    func removeData(indexPath: IndexPath) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        managedContext.delete(self.target[indexPath.row])
        do {
            try managedContext.save()
            
        } catch {
            debugPrint("\(error.localizedDescription)")
        }
        

        
    }
}







