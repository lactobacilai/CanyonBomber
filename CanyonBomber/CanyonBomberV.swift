//
//  CanyonBomberV.swift
//  CanyonBomber
//
//  Created by welai on 2017-01-22.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import UIKit

class CanyonBomberV: UIView {
    
    //MARK: -Vars
    var targetView = TargetV()
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
     func addTargetView() {
     
        let targetFrame = CGRect(x: self.frame.minX,
                                 y: self.bounds.maxY - CGFloat(500),
                                 width: self.bounds.maxX,
                                 height: CGFloat(500))
        targetView.frame = targetFrame
        targetView.backgroundColor = UIColor.blue
        targetView.populateSquares()
        
        self.addSubview(targetView)
    }
    
    
    
    
    

}
