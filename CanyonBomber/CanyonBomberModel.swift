//
//  CanyonBomberModel.swift
//  CanyonBomber
//
//  Created by welai on 2017-01-22.
//  Copyright © 2017 lactobacilai. All rights reserved.
//

import Foundation
import UIKit


struct CanyonBomberModel{

static let targetPerRow = 10
static let height = 250


static func getTargetFrame(parentView: UIView) -> CGRect{
    return CGRect(x: parentView.bounds.minX,
                  y: parentView.bounds.maxY - CGFloat(height),
                  width: parentView.bounds.size.width,
                  height: parentView.bounds.size.height)   
}

}
