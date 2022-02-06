//
//  ColourHelper.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation
import UIKit

class ColourHelper {

    
    static func hexStringToUIColor (hex:String) -> UIColor {
        
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if(cString.hasPrefix("#")) {
            if (cString.count == 4) {
                // #RGB => #RRGGBB
                let r = cString[1];
                let g = cString[2];
                let b = cString[3];
                let red = String(r) + String(r)
                let green = String(g) + String(g)
                let blue = String(b) + String(b)
                
                cString = "#" + red + green + blue // #RRGGBB
            }
            else if (cString.count == 5) {
                // #ARGB => #AARRGGBB
                let a = cString[1];
                let r = cString[2];
                let g = cString[3];
                let b = cString[4];
                let alpha = String(a) + String(a)
                let red = String(r) + String(r)
                let green = String(g) + String(g)
                let blue = String(b) + String(b)
                cString = "#" + alpha  +  red + green + blue   // #AARRGGBB
            }
        }
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        if (cString.count == 6) {
            return UIColor(
                red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8 ) / 255.0,
                blue:  CGFloat((rgbValue & 0x0000FF)      ) / 255.0,
                alpha: CGFloat(1)
            )
            
        }
        else if (cString.count == 8) {
            return UIColor(
                red: CGFloat((rgbValue & 0x00FF0000) >> 16 ) / 255.0,
                green:  CGFloat((rgbValue & 0x0000FF00) >> 8 ) / 255.0,
                blue:CGFloat((rgbValue & 0x000000FF) ) / 255.0,
                alpha: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            )
        }
        else {
            return UIColor.lightGray
        }
    }
    
    
}
