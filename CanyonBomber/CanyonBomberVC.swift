//
//  CanyonBomberVC.swift
//  CanyonBomber
//
//  Created by welai on 2017-01-22.
//  Copyright © 2017 lactobacilai. All rights reserved.
//
/*
 CanyonBomberV is the gameView
 CanyonBomberV will have TargetView and PlayerView
 TargetView will be of any type: Squares (current for now)
 GAME GUIDELINES:   https://atariage.com/manual_html_page.php?SoftwareID=903
 */

import UIKit

class CanyonBomberVC: UIViewController {
    
   
    
    //MARK: -Vars
    //NOTE: be mindful or decimal 
    private let desiredTotalNumOfSquares = 80 //Model
    private let rows = 8    //Model

    
    //MARK: -Outlets
    
    @IBOutlet weak var gameView: CanyonBomberV!{
        didSet{
            print("gameView DIDSET")
            //gameView.backgroundColor = UIColor(red:0.98, green:0.96, blue:0.90, alpha:1.0)
            //let frame = CanyonBomberModel.getTargetFrame(parentView: gameView)
            //targetView = TargetV(frame: frame)
        }
    }
    
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        /*
        let aircraftFrameBg = UIImageView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: self.view.bounds.maxX, height: self.view.bounds.maxY/4)))
        aircraftFrameBg.image = UIImage(named: "cloud.png")
        //self.view.addSubview(aircraftFrameBg)
        self.view.sendSubview(toBack: aircraftFrameBg)
        */
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviews")
        gameView.addTargetView(desiredTotalNumOfSquares: desiredTotalNumOfSquares, rows: rows)
        gameView.targetView!.populateSquares()
        
        gameView.addAircraftView()
        

        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)        
        gameView.targetView!.animating = true
        gameView.aircraftView!.animating = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameView.targetView!.animating = false
        gameView.aircraftView!.animating = false
    }
    

    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    

}
