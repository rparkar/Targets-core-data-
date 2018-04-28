//
//  FInishTargetViewController.swift
//  PostIT
//
//  Created by Rehan Parkar on 2018-04-27.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit
import CoreData

class FInishTargetViewController: UIViewController, UITextFieldDelegate {
    
    //outlets
    @IBOutlet weak var createTargetButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    //variables
    var targetDescription: String!
    var targetType: TargetType!
    
    func initData(description: String, targetType: TargetType) {
    
        self.targetDescription = description
        self.targetType = targetType
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //bound to keyboard

        pointsTextField.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func createTargetButtonPressed(_ sender: Any) {
        
        if pointsTextField.text != "" {
            self.save { (success) in
                
                if success {
                    dismiss(animated: true, completion: nil)
                }
                
            }
        }

        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let target = Targets(context: managedContext)
        
        target.targetDescription = targetDescription!
        target.targetType = targetType.rawValue
        target.targetCompletionValue = Int32(pointsTextField.text!)!
        target.targetProgressValue = Int32(0)
        
        do {
            try managedContext.save()
            completion(true) //saved successfully
        } catch {
            debugPrint("\(error.localizedDescription)")
            completion(false) // did not save
        }
       
        
    }
    
}
