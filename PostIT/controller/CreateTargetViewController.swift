//
//  CreateTargetViewController.swift
//  PostIT
//
//  Created by Rehan Parkar on 2018-04-27.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class CreateTargetViewController: UIViewController, UITextViewDelegate {

    //outlets
    
    @IBOutlet weak var targetTextField: UITextView!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    //variables
    var targetType: TargetType = .longTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()

        // Do any additional setup after loading the view.
    }
    
    func initialSetup() {
        longTermButton.setSelectedColor()
        shortTermButton.setDeselectedColor()
        targetTextField.delegate = self
    }
    

    @IBAction func longTermButtonPressed(_ sender: Any) {
        targetType = .longTerm
        longTermButton.setSelectedColor()
        shortTermButton.setDeselectedColor()
    }
    
    @IBAction func shortTermButtonPressed(_ sender: Any) {
        targetType = .shortTerm
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }
    
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        
        if targetTextField.text != "" {
            
            guard let finishTargetVC = storyboard?.instantiateViewController(withIdentifier: "FinishTargetVC") as? FInishTargetViewController else {return}
            
            finishTargetVC.initData(description: targetTextField.text!, targetType: targetType)
            present(finishTargetVC, animated: true, completion: nil)
        
        }
        

        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        targetTextField.text = ""
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
