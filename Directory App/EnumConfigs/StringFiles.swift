//
//  StringFiles.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation
import UIKit

enum StringFiles:String{
    case Colour
}

enum ColorTypes:String{
    
    // fixed colors
    case colorWhite
    case colorBlack
    // theme
    case colorPrimary
    
    //navigation
    case navigationBarTitleTextAttributeColor
    case navigationBarTintColor
    
    /// used to short cut to these known values when parsing ColorType enum proxies
    static let fixedColors:Array<ColorTypes>=[.colorBlack,.colorWhite]

    static func color(_ type:ColorTypes, defaultColor:UIColor = .lightGray)->UIColor{
        switch type {
        case .colorBlack:
             return UIColor.black
        case .colorWhite:
            return UIColor.white
        

        default:
            return createColor(for: type)
        }
    }
    /// Fetches a UIColor for a known ColorType
    /// - Parameters:
    ///   - id: ColorTypes enum
    ///   - defaultColor: Used to provide a known fallback color if the key cannot be found
    /// - Returns: UIColor
    static private func createColor(for type:ColorTypes, defaultColor: UIColor = UIColor.lightGray)->UIColor{
        
        var color=defaultColor
        
        // basic key to color string lookup
        var stringValue=Bundle.main.localizedString(forKey:type.rawValue, value:type.rawValue, table:StringFiles.Colour.rawValue)
        
        // localizedString will return the key if the key cannot be found
        // if so, we return the default color
        guard stringValue != type.rawValue else {return defaultColor}
        guard !stringValue.isEmpty else {return defaultColor}
        
        // attempt to create the real stringValue if this stringValue is actually a proxy key
        if let colorProxy=ColorTypes.init(rawValue: stringValue){
            
            // if the proxy is a known fixed color, return immediately
            if ColorTypes.fixedColors.contains(colorProxy){
                return ColorTypes.color(colorProxy)
            }
            
            stringValue=Bundle.main.localizedString(forKey:colorProxy.rawValue, value:colorProxy.rawValue, table:StringFiles.Colour.rawValue)
        }
        
        guard !stringValue.isEmpty else {return defaultColor}
        
  
        color=ColourHelper.hexStringToUIColor(hex: stringValue)
        
        
        return color
    }


}

