//
//  Util.swift
//  QProject
//
//  Created by VincentHe on 8/28/16.
//  Copyright © 2016 VincentHe. All rights reserved.
//

import UIKit

class Util: NSObject {
    static func makeCircleAtLocation(location:CGPoint,radius:CGFloat) -> UIBezierPath
    {
        let path = UIBezierPath()
        path.addArcWithCenter(location, radius: radius, startAngle: 0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        return path
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(cString.startIndex.advancedBy(1))
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
