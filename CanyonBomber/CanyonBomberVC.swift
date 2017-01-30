//
//  CanyonBomberVC.swift
//  CanyonBomber
//
//  Created by welai on 2017-01-22.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import UIKit

class CanyonBomberVC: UIViewController {
    
   
    
    //MARK: -Vars
    var targetView = TargetV()    
    //MARK: -Outlets
    
    @IBOutlet weak var gameView: CanyonBomberV!{
        
        didSet{
            print("gameView DIDSET")
            //gameView.backgroundColor = UIColor.cyan
            //let frame = CanyonBomberModel.getTargetFrame(parentView: gameView)
            //targetView = TargetV(frame: frame)
        }
    }
    
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print("viewDidLoad")
        
        
        
        //print("gameView: x=>\(gameView.bounds.minX), y=>\(gameView.bounds.minY), xMax=>\(gameView.bounds.maxX), yMax=>\(gameView.bounds.maxY) ")
    
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
        gameView.addTargetView()
        
        
        //print("gameView: x=>\(gameView.bounds.minX), y=>\(gameView.bounds.minY), xMax=>\(gameView.bounds.maxX), yMax=>\(gameView.bounds.maxY) ")
        
        
//        let targetFrame = CGRect(x: gameView.frame.minX,
//                                 y: gameView.bounds.maxY - CGFloat(500),
//                                 width: gameView.bounds.maxX,
//                                 height: CGFloat(500))
//        targetView.frame = targetFrame
//        targetView.backgroundColor = UIColor.blue
//        targetView.populateSquares()
//        
//        gameView.addSubview(targetView)
//        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)        
        gameView.targetView.animating = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameView.targetView.animating = false
    }
    

    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    

}
