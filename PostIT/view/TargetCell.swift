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
    
    
    func configureCell(description: String, termType: String, targetAmount: Int) {
        
        self.targetProgressLabel.text = String(describing: targetAmount)
        self.targetTermTypeLabel.text = termType
        self.targetDescriptionLabel.text = description
    }
    
}
