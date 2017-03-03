//
//  TargetV.swift
//  CanyonBomber
//
//  Created by welai on 2017-01-22.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import UIKit

class TargetV: UIView  {
    
    private let desiredTotalNumOfSquares: Int?
    private let rows: Int?
    private  var squaresPerRow: Int? {
        return desiredTotalNumOfSquares!/rows!
    }

    private lazy var animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    private let squareBehavior = SquareBehavior()

    var animating: Bool = false{
        didSet{
            if animating{
                animator.addBehavior(squareBehavior)
            }else{
                animator.removeBehavior(squareBehavior)
            }
        }
    }
    
    private var color = UIColor.white //.cyan
    var countSquares = 0
    
    
    private var squareSize: CGSize{
        let width = self.bounds.width/CGFloat(squaresPerRow!)
        return CGSize(width: width, height: width)
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    init(desiredTotalNumOfSquares: Int, rows: Int, frame: CGRect) {
        self.desiredTotalNumOfSquares = desiredTotalNumOfSquares
        self.rows = rows
        super.init(frame: frame)
    }

    
    
    override init(frame: CGRect) {
        self.desiredTotalNumOfSquares = 1
        self.rows = 1
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    
    
    
    func addSquare(origin: CGPoint){
        
        print("------------\(countSquares)------------")
        
        let startX = origin.x //- CGFloat(countSquares*10)
        let startY = origin.y
        let startOrigin = CGPoint(x: startX , y: startY)
        //print("startOrigin: \(startOrigin.x), \(startOrigin.y)")

        let squareFrame = CGRect(origin: startOrigin, size: squareSize)
        let square = UIView(frame: squareFrame)
        //print("addSquare1: \(square.frame)")
        
        let countLabelFrame = CGRect(origin: CGPoint.zero, size: CGSize(width: squareSize.width, height: squareSize.height) )
        let label = UILabel(frame: countLabelFrame)
        label.text = "\(countSquares)"
        label.font = UIFont(name: "Helvetica", size: CGFloat(7))
        
        square.addSubview(label)
        
        /*
        if(color == UIColor.green){
            color = UIColor.orange
        }else if(color == UIColor.orange){
            color = UIColor.purple
        }else{
            color = UIColor.green
        }
        */
        
        square.backgroundColor = color
        
        //add to TargetV
        self.addSubview(square)
        
        //print("addSquare2: \(square.frame)")
        
        let newX = origin.x
        let newY = origin.y
        let updatedOrigin = CGPoint(x: newX , y: newY)
        //let boundRect = CGRect(origin: updatedOrigin, size: squareSize)
        print("boundRect: \(updatedOrigin.x), \(updatedOrigin.y)")
        
        squareBehavior.addItem(item: square)
        
    }
    
    func populateSquares(){
        
        print("WIDTH: \(self.bounds.width) -- HEIGHT: \(self.bounds.height)")
        
        //for the boundRect
        for row in 1...rows!{
            
            if(color == UIColor.orange){
                color = UIColor.white
            }else if(color == UIColor.white){
                color = UIColor.orange
            }
//            else{
//                color = UIColor.orange
//            }
            
            //start at zero so it snaps to the edge
            for i in 1...squaresPerRow!{
                
                var xPoint = self.bounds.width - ( squareSize.width * CGFloat(i) ) - ( CGFloat(30) )
                
                if(i == squaresPerRow){
                    xPoint = self.bounds.width - ( squareSize.width * CGFloat(i) )
                }
                
                let yPoint = self.bounds.height - (squareSize.height * CGFloat(row) )
                
                let coordinates = CGPoint(x: xPoint, y: yPoint)
                
                print("x: \(xPoint), y: \(yPoint)")
                
                
                countSquares += 1
                
                addSquare(origin: coordinates)
                //print("\(collisionBehaviour.boundary(withIdentifier: "test" as NSCopying))")
            }
            print("===================================")
            
            

        }
        
        print("countSquares: \(countSquares)")
        
     }
    
    
    override func layoutSubviews() { super.layoutSubviews()    }
    override func willMove(toSuperview newSuperview: UIView?) { super.willMove(toSuperview: newSuperview) }
    
}
