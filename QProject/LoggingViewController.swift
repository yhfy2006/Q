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
    let startAnimation = CAKeyframeAnimation(keyPath: "position")
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
        //centerRoundShape.bounds = CGPathGetPathBoundingBox(centerRoundShape.path)
        view.layer.addSublayer(centerRoundShape)
        
        // start building animation path
        let startingPoint = CGPointMake(self.launchButton!.center.x, self.launchButton!.center.y - radis)
        self.statusPointShape.path = Util.makeCircleAtLocation(startingPoint, radius: 7).CGPath
        self.statusPointShape.strokeColor = Util.hexStringToUIColor("25BFF0").CGColor
        self.statusPointShape.fillColor = self.view.backgroundColor?.CGColor
        self.statusPointShape.lineWidth = 3.0
        
            
        view.layer.addSublayer(statusPointShape)
        
        
//        let anchorPoint = self.launchButton!.center
//        self.statusPointShape.anchorPoint = anchorPoint
//        let rotateAnimation = CABasicAnimation(keyPath:"position")
//        rotateAnimation.toValue =  CGFloat(M_PI)*2 // The angle we are rotating to
//        self.statusPointShape.addAnimation(rotateAnimation, forKey: "position")
        
        let boundingRect = CGRectMake(self.launchButton!.frame.origin.x, self.launchButton!.frame.origin.y, self.launchButton!.frame.size.width, self.launchButton!.frame.size.height)
        let orbit = CAKeyframeAnimation(keyPath:"position")
        orbit.duration = 3
        
        let testShape = CAShapeLayer()
        testShape.path = CGPathCreateWithEllipseInRect(CGPathGetPathBoundingBox(centerRoundShape.path),nil)
        testShape.fillColor = UIColor.redColor().CGColor
        testShape.strokeColor = UIColor.greenColor().CGColor
        view.layer.addSublayer(testShape)
        
        
        orbit.path = CGPathCreateWithEllipseInRect(CGPathGetPathBoundingBox(centerRoundShape.path),nil)
        orbit.calculationMode = kCAAnimationPaced
        orbit.repeatCount = Float.infinity
        orbit.rotationMode = kCAAnimationRotateAuto;
        self.statusPointShape.addAnimation(orbit, forKey: "Move7")
        
        
        let aView = UIView(frame: CGRectMake(0, 0, 50, 50))
        aView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(aView)
        
        
        
//        startAnimation.duration = 3
//        startAnimation.repeatCount = Float.infinity
//        startAnimation.path = Util.makeCircleAtLocation(self.launchButton!.center, radius: radis).CGPath
//        startAnimation.calculationMode = kCAAnimationPaced
//        startAnimation.fillMode = kCAFillModeForwards
//        startAnimation.removedOnCompletion = false
//        startAnimation.values = [0,CGFloat(M_PI),CGFloat(M_PI)*1.7,CGFloat(M_PI)*2]
//        
//        self.statusPointShape.addAnimation(startAnimation, forKey: "position")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

