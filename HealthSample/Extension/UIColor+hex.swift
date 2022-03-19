//
//  UIColor+hex.swift
//  HealthSample
//
//  Created by Shaolin Zhou on 2021/10/17.
//

import Foundation
import UIKit

extension UIColor{
    class func colorWithHex(hexStr:String) -> UIColor{
        return UIColor.colorWithHex(hexStr: hexStr, alpha: 1)
    }
}

extension UIColor{
    class func colorWithHex(hexStr:String, alpha:Float) -> UIColor{
        var cStr = hexStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased() as NSString;
        
        if(cStr.length < 6){
            return UIColor.clear;
        }
        
        if(cStr.hasPrefix("0x")) {
            cStr = cStr.substring(from: 2) as NSString
        }
        
        if(cStr.hasPrefix("#")){
            cStr = cStr.substring(from: 1) as NSString
        }
        
        if(cStr.length != 6){
            return UIColor.clear;
        }
        
        var range = NSRange.init()
        range.location = 0
        range.length = 2
        
        //r
        let rStr = cStr.substring(with: range)
        
        //g
        range.location = 2
        let gStr = cStr.substring(with: range)
        
        //b
        range.location = 4
        let bStr = cStr.substring(with: range)
        
        var r : UInt32 = 0x0
        var g : UInt32 = 0x0
        var b : UInt32 = 0x0
        
        Scanner.init(string: rStr).scanHexInt32(&r);
        Scanner.init(string: gStr).scanHexInt32(&g);
        Scanner.init(string: bStr).scanHexInt32(&b);
        
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: CGFloat(alpha));
        
    }
}
