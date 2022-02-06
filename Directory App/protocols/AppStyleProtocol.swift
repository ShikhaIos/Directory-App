//
//  AppStyleProtocol.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation
import UIKit

protocol AppStyleProtocol {

    static func applyColors(type:AppViewStyleable)

}

extension AppStyleProtocol{
    
    static func styleForView(view:UIView, data:Any?=nil){
        AppStyling.defaultStyleForView(view: view, data: data)
    }
}
