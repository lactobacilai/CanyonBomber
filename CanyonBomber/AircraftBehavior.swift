//
//  AircraftBehavior.swift
//  CanyonBomber
//
//  Created by welai on 2017-03-04.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import UIKit

class AircraftBehavior: UIDynamicBehavior {

    private var gravityBehaviour:UIGravityBehavior = {
        let gravity = UIGravityBehavior()
        gravity.angle = 0
        gravity.magnitude = 0.03
        return gravity
    }()
    
    private var itemDynamicBehavior: UIDynamicItemBehavior = {
        let dib = UIDynamicItemBehavior()
        dib.allowsRotation = false
        dib.elasticity = 0.01
        return dib
    }()
    
    
    override init(){
        super.init()
        self.addChildBehavior(self.gravityBehaviour)
        self.addChildBehavior(self.itemDynamicBehavior)
    }
    
    
    
    func addItem(item: UIDynamicItem){
        self.gravityBehaviour.addItem(item)
        self.itemDynamicBehavior.addItem(item)
    }
    
    func removeItem(item: UIDynamicItem){
        self.gravityBehaviour.removeItem(item)
        self.itemDynamicBehavior.removeItem(item)
    }
    

}
