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
    var statusPointView = UIView()
    var startAnimation = CAKeyframeAnimation(keyPath: "position")
    var animating = false
    
    let ringBlue = Util.hexStringToUIColor("25BFF0").CGColor
    let buttonGrey = Util.hexStringToUIColor("979797").CGColor
    
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
        
        centerRoundShape.strokeColor = self.buttonGrey
        centerRoundShape.fillColor = nil
        centerRoundShape.lineWidth = 3.0
        //centerRoundShape.bounds = CGPathGetPathBoundingBox(centerRoundShape.path)
        view.layer.addSublayer(centerRoundShape)
        
        // start building animation path
        let startingPoint = CGPointMake(self.launchButton!.center.x, self.launchButton!.center.y - radis)
        let orbit = CAKeyframeAnimation(keyPath:"position")
        orbit.duration = 5
    
        orbit.path = CGPathCreateWithEllipseInRect(CGPathGetPathBoundingBox(centerRoundShape.path),nil)
        orbit.calculationMode = kCAAnimationPaced
        orbit.repeatCount = Float.infinity
        orbit.rotationMode = kCAAnimationRotateAuto;
        
        self.startAnimation = orbit
        
        
        let aView = UIView(frame: CGRectMake(0, 0, 14, 14))
        aView.layer.cornerRadius = aView.frame.size.width/2
        aView.backgroundColor = self.view.backgroundColor
        aView.clipsToBounds = true
        aView.layer.borderColor = self.ringBlue
        aView.layer.borderWidth = 2.0
        
        self.statusPointView = aView
        self.statusPointView.center = startingPoint
        self.view.addSubview(self.statusPointView)
        self.statusPointView.hidden = true
        
    }
    
    @IBAction func launchButtonClicked(){
        if(self.animating)
        {
            self.statusPointView.layer.removeAllAnimations()
            self.animating = false
            self.centerRoundShape.strokeColor = self.buttonGrey
            self.statusPointView.hidden = true
        }else
        {
            self.statusPointView.layer.addAnimation(self.startAnimation, forKey: "Move7")
            self.animating = true
            self.centerRoundShape.strokeColor = self.ringBlue
            self.statusPointView.hidden = false
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

