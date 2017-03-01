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
    private let desiredTotalNumOfSquares = 10 //will be set by VC from Model
    private let rows = 2
    private  var itemPerRow: Int {
        return desiredTotalNumOfSquares/rows
    }

    //10/5*3 = 6,,
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
     func addTargetView() {
     
        let computerHeight = (self.bounds.maxX / CGFloat (itemPerRow) ) * CGFloat(rows)
        let targetFrame = CGRect(x: self.frame.minX,
                                 y: self.bounds.maxY - computerHeight,
                                 width: self.bounds.maxX,
                                 height: computerHeight)
        
        targetView.frame = targetFrame
        targetView.backgroundColor = UIColor.darkGray
        targetView.populateSquares()
        
        self.addSubview(targetView)
    }
    
    
    
    
    

}
