//
//  ViewController.swift
//  QProject
//
//  Created by VincentHe on 8/28/16.
//  Copyright © 2016 VincentHe. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

class ViewController: UIViewController {

    let centerRoundShape = CAShapeLayer()
    let statusPointShape = CAShapeLayer()
    let startAnimation = CAKeyframeAnimation(keyPath: "Go")
    @IBOutlet var launchButton:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //launchButton?.layer.addSublayer(centerRoundShape)


        //launchButton?.layer.insertSublayer(centerRoundShape, above: launchButton?.layer)
        //launchButton?.layer.insertSublayer(centerRoundShape, atIndex: 0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        initView()
        
    }
    
    
    func initView() {
        let radis = launchButton!.bounds.size.width/2.0 + 10
        centerRoundShape.path = Util.makeCircleAtLocation(view.center, radius: radis).CGPath
        
        centerRoundShape.strokeColor = Util.hexStringToUIColor("25BFF0").CGColor
        centerRoundShape.fillColor = nil
        centerRoundShape.lineWidth = 3.0
        view.layer.addSublayer(centerRoundShape)
        
        // start building animation path
        let startingPoint = CGPointMake(self.launchButton!.center.x, self.launchButton!.center.y - radis)
        self.statusPointShape.path = Util.makeCircleAtLocation(startingPoint, radius: 7).CGPath
        self.statusPointShape.strokeColor = Util.hexStringToUIColor("25BFF0").CGColor
        self.statusPointShape.fillColor = self.view.backgroundColor?.CGColor
        self.statusPointShape.lineWidth = 3.0

        view.layer.addSublayer(statusPointShape)
        
        startAnimation.duration = 3
        startAnimation.repeatCount = Float.infinity
        //startAnimation.path = Util.makeCircleAtLocation(startingPoint, radius: 7).CGPath
        //startAnimation.calculationMode = kCAAnimationPaced
        startAnimation.fillMode = kCAFillModeForwards
        startAnimation.removedOnCompletion = false
        startAnimation.values = [0,CGFloat(M_PI),CGFloat(M_PI)*1.7,CGFloat(M_PI)*2]
        
        self.statusPointShape.addAnimation(startAnimation, forKey: "Go")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

