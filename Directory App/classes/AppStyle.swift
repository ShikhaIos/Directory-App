//
//  AppStyle.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation
import UIKit

class AppStyle:AppStyleProtocol{

        
    static func applyColors(type:AppViewStyleable){
        switch type {
        case .home(let controller):
            controller.viewPeopleListButton.backgroundColor = ColorTypes.color(.colorPrimary)
            controller.viewRoomListButton.backgroundColor = ColorTypes.color(.colorPrimary)
        case .detail(let controller):
            controller.nameLabel.textColor = ColorTypes.color(.colorPrimary)
            
        default : break

        }
    }
    
    static func styleForView(view:UIView, data:Any?=nil){
        
        AppStyling.defaultStyleForView(view: view, data: data)
    }
}
