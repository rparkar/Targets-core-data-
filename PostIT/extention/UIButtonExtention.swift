//
//  UIButtonExtention.swift
//  PostIT
//
//  Created by Rehan Parkar on 2018-04-27.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0.07594997436, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.9719243646, green: 0.5750896931, blue: 0.5594777465, alpha: 1)
    }
}
