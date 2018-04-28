//
//  FInishTargetViewController.swift
//  PostIT
//
//  Created by Rehan Parkar on 2018-04-27.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

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
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
