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
    var targetView:TargetV?
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    func addTargetView(desiredTotalNumOfSquares: Int, rows: Int) {
     
        let squaresPerRow = desiredTotalNumOfSquares/rows
        let computedHeight = (self.bounds.maxX / CGFloat (squaresPerRow) ) * CGFloat(rows)
        let targetFrame = CGRect(x: self.frame.minX,
                                 y: self.bounds.maxY - computedHeight,
                                 width: self.bounds.maxX,
                                 height: computedHeight)
        
        targetView = TargetV(desiredTotalNumOfSquares: desiredTotalNumOfSquares, rows: rows, frame: targetFrame)
        
        targetView!.backgroundColor = UIColor.darkGray
        self.addSubview(targetView!)
        
    }
    
    
    
    
    

}
