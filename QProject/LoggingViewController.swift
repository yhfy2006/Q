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
    
    var startRecording = false
    var animating = false
    
    let ringBlue = Util.hexStringToUIColor("25BFF0").CGColor
    let buttonGrey = Util.hexStringToUIColor("979797").CGColor
    
    @IBOutlet var launchButton:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        initView()
        
    }
    
    
    func initView() {
        let radis = launchButton!.bounds.size.width/2.0 + 10
        centerRoundShape.path = Util.makeCircleAtLocation(self.launchButton!.center, radius: radis).CGPath
        
        centerRoundShape.strokeColor = self.buttonGrey
        centerRoundShape.fillColor = nil
        centerRoundShape.lineWidth = 3.0
        //centerRoundShape.frame = CGRectMake(0, 0, launchButton!.bounds.size.width/2.0 + 10, launchButton!.bounds.size.width/2.0 + 10)
        //self.launchButton?.layer.addSublayer(centerRoundShape)
        
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
            
            
//            UIView.animateWithDuration(.5, animations: {
//                self.launchButton?.layer.position.y -= 100
//                self.centerRoundShape.position.y -= 100
//            })
            
            UIView.animateWithDuration(1.0, delay: 0.0,
                                       usingSpringWithDamping: 0.25,
                                       initialSpringVelocity: 0.0,
                                       options: [],
                                       animations: {
//                                        self.centerRoundShape.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
//                                        self.launchButton?.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
                                        self.launchButton?.layer.position.y -= 100
                                        self.centerRoundShape.position.y -= 100
                                        
                                        
                }, completion: nil)
        }else
        {
            
            self.statusPointView.layer.addAnimation(self.startAnimation, forKey: "Move7")
            self.animating = true
            self.centerRoundShape.strokeColor = self.ringBlue
            self.statusPointView.hidden = false
            
            UIView.animateWithDuration(1.0, delay: 0.0,
                                       usingSpringWithDamping: 0.25,
                                       initialSpringVelocity: 0.0,
                                       options: [],
                                       animations: {
                                        self.launchButton?.center = self.view.center
                                        if(self.startRecording)
                                        {
                                            self.centerRoundShape.position.y += 100
//                                            self.launchButton?.layer.transform = CATransform3DMakeScale(1, 1, 1.0)
//                                            self.centerRoundShape.transform = CATransform3DMakeScale(1, 1, 1.0)

                                        }
                                        
            }, completion: nil)
            
            
//            UIView.animateWithDuration(1.0, animations: {
//                self.launchButton?.center = self.view.center
//                if(self.startRecording)
//                {
//                   self.centerRoundShape.position.y += 100
//                }
//            })
            
            self.startRecording = true
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

