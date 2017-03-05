//
//  SquareBehavior.swift
//  CanyonBomber
//
//  Created by welai on 2017-01-29.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import UIKit

class TargetBehavior: UIDynamicBehavior {
    
    private var gravityBehaviour:UIGravityBehavior = {
        let gravity = UIGravityBehavior()
        gravity.angle = 0
        //gravity.gravityDirection = CGVector(dx: 0, dy: 1)
        gravity.magnitude = 0.01
        return gravity
    }()
    
    private var collisionBehaviour:UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider

        /*
        collisionBehaviour = UICollisionBehavior() //items: [square]
        collisionBehaviour.addBoundary(withIdentifier: "test" as NSCopying, for: rect) //UIBezierPath(rect: boundRect))
        collisionBehaviour.translatesReferenceBoundsIntoBoundary = true
         collisionBehaviour.addBoundary(withIdentifier: "test" as NSCopying, for: line) //UIBezierPath(rect: boundRect))
        
                collisionBehaviour.addBoundary(withIdentifier: "test" as NSCopying,
                                               from: CGPoint(x: origin.x , y: origin.y),
                                               to: CGPoint(x: origin.x , y: origin.y)
                )
        */
        
    }()
    
    private var itemDynamicBehaviour:UIDynamicItemBehavior = {
        let dib = UIDynamicItemBehavior()
        dib.allowsRotation = false
        dib.elasticity = 0.01
        return dib
    }()
    

    override init(){
        super.init()
        self.addChildBehavior(gravityBehaviour)
        self.addChildBehavior(collisionBehaviour)
        self.addChildBehavior(itemDynamicBehaviour)
    }
    
    
    func addItem(item: UIDynamicItem){
        self.gravityBehaviour.addItem(item)
        self.collisionBehaviour.addItem(item)
        self.itemDynamicBehaviour.addItem(item)
    }
    
    
    func removeItem(item: UIDynamicItem){
        self.gravityBehaviour.removeItem(item)
        self.collisionBehaviour.removeItem(item)
        self.itemDynamicBehaviour.removeItem(item)
    }

}
