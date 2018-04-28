//
//  TargetCell.swift
//  PostIT
//
//  Created by Rehan Parkar on 2018-04-27.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

class TargetCell: UITableViewCell {

    //outlets
    @IBOutlet weak var targetDescriptionLabel: UILabel!
    @IBOutlet weak var targetTermTypeLabel: UILabel!
    @IBOutlet weak var targetProgressLabel: UILabel!
    @IBOutlet weak var targetCompleteView: UIView!
    
    func configureCell(targte: Targets) {
        
        self.targetDescriptionLabel.text = targte.targetDescription
        self.targetTermTypeLabel.text = targte.targetType
        self.targetProgressLabel.text = String(describing: targte.targetProgressValue)
        
        if targte.targetProgressValue == targte.targetCompletionValue {
            
            targetCompleteView.isHidden = false
        } else {
            self.targetCompleteView.isHidden = true
        }
    }
    
//    func configureCell(description: String, termType: TargetType, targetAmount: Int32) {
//
//        self.targetProgressLabel.text = String(describing: targetAmount)
//        self.targetTermTypeLabel.text = termType.rawValue
//        self.targetDescriptionLabel.text = description
//    }
    
}
