//
//  BindToKeyBoard.swift
//  PostIT
//
//  Created by Rehan Parkar on 2018-04-29.
//  Copyright © 2018 Rehan Parkar. All rights reserved.
//

import UIKit

extension UIView {
    
    func bindToKeyBoard() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardChange(_:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
    }
    
    @ objc func keyBoardChange(_ notification: NSNotification) {
        
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        
        UIView.animate(withDuration: duration, delay: 0.0, options: UIViewAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    
    }
    
}
