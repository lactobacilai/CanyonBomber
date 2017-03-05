//
//  PlaneV.swift
//  CanyonBomber
//
//  Created by welai on 2017-03-04.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import UIKit

class AircraftV: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    enum AircraftType {
        case AIRPLANE
        case HELICOPTER
        case BLIMP
        case BALLOON
        case JET
        case SPACESHIP
    }
    
    private let aircraftBehavior = AircraftBehavior()
    private lazy var animator: UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    private var _aircraft: UIView?
    
    
    var animating: Bool = false{
        didSet{
            if(animating){
                print("ADD")
                animator.addBehavior(aircraftBehavior)
            }else{
                print("REMOVED")
                animator.removeBehavior(aircraftBehavior)
            }
        }
    }
    
    /*
       AircraftV attributes
       -image
       -frameSize
       -Another class that is BombV
        -bombSize
        -bombImage
     */
    init(frame: CGRect, aircraftType: AircraftType) {
        super.init(frame: frame)
        self.setAircraft(frame: frame, aircraftType: aircraftType)
        aircraftBehavior.addItem(item: _aircraft!)
        self.addSubview(self._aircraft!)
    }

    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    
    
    private func setAircraft(frame: CGRect, aircraftType: AircraftType){
        
        var image: UIImage?
        var aircraftFrameW: CGFloat?
        var aircraftFrameH: CGFloat?
        //altitude, highest = 0
        var y = CGFloat(0)
        
        switch aircraftType{
        
        case .AIRPLANE:
            image = UIImage(named: "helicopter.png")!
            aircraftFrameW = frame.size.width/6
            aircraftFrameH = frame.size.width/4
            
        case .HELICOPTER:
            image = UIImage(named: "helicopter.png")!
            aircraftFrameW = frame.size.width/4
            aircraftFrameH = frame.size.width/4
            //fly lower
            y = CGFloat(10)
            
        case .BLIMP:
            image = UIImage(named: "blimp.png")!
            aircraftFrameW = frame.size.width/4
            aircraftFrameH = frame.size.width/4
            
        case .BALLOON:
            image = UIImage(named: "hotAirBalloon.png")!
            aircraftFrameW = frame.size.width/6
            aircraftFrameH = frame.size.width/4
            
        case .JET:
            image = UIImage(named: "hotAirBalloon.png")!
            aircraftFrameW = frame.size.width/6
            aircraftFrameH = frame.size.width/4
            
        case .SPACESHIP:
            image = UIImage(named: "spaceship.png")!
            aircraftFrameW = frame.size.width/6
            aircraftFrameH = frame.size.width/4
        }
        
        
        //imageView
        let aircraftImage = UIImageView(frame: CGRect(x: 0, y: 0, width: aircraftFrameW!, height: aircraftFrameH!) )
        aircraftImage.image = image!
        aircraftImage.contentMode = UIViewContentMode.scaleAspectFit
        //aircraftImage.backgroundColor = UIColor(red:0.98, green:0.96, blue:0.90, alpha:1.0)
        
        //aircraftView
        self._aircraft = UIView(frame: CGRect(x: -aircraftFrameW!, y: y, width: aircraftFrameW!, height: aircraftFrameH!) )
        //self._aircraft!.backgroundColor = UIColor(red:0.98, green:0.96, blue:0.90, alpha:1.0)
        self._aircraft!.addSubview(aircraftImage)
        
    }
    
   
    
    
    //plane appears and start moving
    func addPlane(origin: CGPoint, aircraftType: AircraftType){
        /*
        let xPoint = self.bounds.width
        let yPoint = self.bounds.height
        let coordinates = CGPoint(x: xPoint, y: yPoint)
        */
    }
    
    func removePlane(parentView: UIView){
        
        /*
        if (!CGRectContainsRect(parentView.superview.bounds, self.frame))
        {
            //view is completely out of bounds of its super view.
        }
        */
        
    }
    
    override func layoutSubviews() { super.layoutSubviews()    }
    override func willMove(toSuperview newSuperview: UIView?) {
        print("willMove")
        super.willMove(toSuperview: newSuperview)
    }
    
    
    /*
    override func willRemoveSubview(_ subview: UIView) {
        print("REMOVIIIIIING")
        super.willRemoveSubview(subview)
    }
    */
}

