//
//  TargetV.swift
//  CanyonBomber
//
//  Created by welai on 2017-01-22.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import UIKit

class TargetV: UIView  {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
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
    
    
    private let rows = 1
    private let itemPerRow = 10 //will be set by VC from Model
    private var color = UIColor.cyan
    var countSquares = 0

    
    
    private var squareSize: CGSize{
        let width = self.bounds.width/CGFloat(itemPerRow)
        return CGSize(width: width, height: width)
    }
    
    
    
    func addSquare(origin: CGPoint){
        
        print("------------\(countSquares)------------")
        
        let startX = origin.x - CGFloat(countSquares*10) // origin.x - CGFloat(30) // CGFloat(0) //
        let startY = origin.y // self.bounds.maxY - (squareSize.height*2) //- CGFloat(300) //self.bounds.height //origin.y //+ CGFloat(5)
        let startOrigin = CGPoint(x: startX , y: startY)
        print("startOrigin: \(startOrigin.x), \(startOrigin.y)")

        var squareFrame = CGRect(origin: startOrigin, size: squareSize)
//        if(isFirst){
//            squareFrame.origin.x += squareSize.width
//            //isFirst = false
//        }
//        squareFrame.origin.x = CGFloat(0)
//        squareFrame.origin.y = self.bounds.minY //self.bounds.height - CGFloat(100)
        
        //let squareFrame = CGRect(origin: CGPoint.zero, size: squareSize)
        //let squareFrame = CGRect(origin: origin, size: squareSize)
        
        let square = UIView(frame: squareFrame)
        
        
        let squareFrame2 = CGRect(origin: CGPoint.zero, size: CGSize(width: squareSize.width, height: squareSize.height) )
        let label = UILabel(frame: squareFrame2)
        label.text = "\(countSquares)"
        
        square.addSubview(label)
        
        
        if(color == UIColor.cyan){
            color = UIColor.orange
        }else if(color == UIColor.orange){
            color = UIColor.purple
        }else{
            color = UIColor.cyan
        }
        
        square.backgroundColor = color
        
        //add to TargetV
        self.addSubview(square)
        
        print("addSquare: \(square.frame)")
        
        let newX = origin.x//-(0*(squareSize.width)) // CGFloat(375.0) //
        let newY = origin.y//-(squareSize.width)
        let updatedOrigin = CGPoint(x: newX , y: newY)
        let boundRect = CGRect(origin: updatedOrigin, size: squareSize)
        
        
        
        print("boundRect: \(updatedOrigin.x), \(updatedOrigin.y)")
        
        squareBehavior.addItem(item: square)
        
        
//        let line = UIBezierPath()
//       // line.addLine(to: updatedOrigin)
//        line.move(to: CGPoint(x: origin.x, y: self.bounds.height) )
//        line.addLine(to: updatedOrigin)
//        //line.fill()
        
    
//        let rect = UIBezierPath(rect: boundRect)
//        //rect.fill()
        
        
        
    }
    
    func populateSquares(){
                
        //for the boundRect
        for row in 1...rows{
            //start at zero so it snaps to the edge
            for i in 0...itemPerRow-1{
                let xPoint = self.bounds.width - ( squareSize.width * CGFloat(i) )
                let yPoint = self.bounds.height - (squareSize.height * CGFloat(row) )
                let coordinates = CGPoint(x: xPoint, y: yPoint)
                
                //print("x: \(xPoint), y: \(yPoint)")
                
                
                countSquares += 1
                
                addSquare(origin: coordinates)
                
//                if i == 1 {
//                    break
//                }
                //print("\(collisionBehaviour.boundary(withIdentifier: "test" as NSCopying))")
            }
            print("===================================")
            

        }
        
        print("countSquares: \(countSquares)")
        
     }
    
    
    override func layoutSubviews() { super.layoutSubviews()    }
    override func willMove(toSuperview newSuperview: UIView?) { super.willMove(toSuperview: newSuperview) }
    
}
