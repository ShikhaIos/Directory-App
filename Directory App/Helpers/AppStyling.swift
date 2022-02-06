//
//  AppStyling.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation
import UIKit

class AppStyling{
    
    ///Global set for Navigation bar
    ///appearance
    
    static func appearance(){
        
        if #available(iOS 13, *){
            
            let navbarAppearance=UINavigationBarAppearance()
            navbarAppearance.configureWithOpaqueBackground()
            navbarAppearance.backgroundColor = ColorTypes.color(.colorPrimary)
            navbarAppearance.titleTextAttributes=[NSAttributedString.Key.foregroundColor : ColorTypes.color(.navigationBarTitleTextAttributeColor)]
            
            UINavigationBar.appearance().tintColor = ColorTypes.color(.navigationBarTintColor)
            
            UINavigationBar.appearance().standardAppearance=navbarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance=navbarAppearance
            
            
            UINavigationBar.appearance(whenContainedInInstancesOf: [UIDocumentBrowserViewController.self]).tintColor = .systemBlue
            UINavigationBar.appearance(whenContainedInInstancesOf: [UIActivityViewController.self]).tintColor = .systemBlue
            
        }else{
            
            UINavigationBar.appearance().barTintColor = ColorTypes.color(.colorPrimary)
            UINavigationBar.appearance().tintColor = ColorTypes.color(.navigationBarTintColor)
            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : ColorTypes.color(.navigationBarTitleTextAttributeColor)]
            UINavigationBar.appearance().isTranslucent=false
            
            
            
        }
        
    }

    static func applyStyling(_ type:AppViewStyleable){
        Self.applyColors(type: type)
    }


    static func applyColors(type:AppViewStyleable){

        AppStyle.applyColors(type:type)

    }
    static func styleForView(view:UIView, data:Any?=nil){

        AppStyling.defaultStyleForView(view: view, data: data)

    }
    
    
}

extension AppStyling{
    
    static func defaultStyleForView(view:UIView, data:Any?){
        
        switch view {
            
        case let button as UIButton:
            
            button.backgroundColor=ColorTypes.color(.colorPrimary)
            
        case let cell as PeopleListViewCell :
            cell.nameLabel.textColor = ColorTypes.color(.colorPrimary)
            
        case let cell as RoomsListViewCell :
            cell.maxOccupancy.textColor = ColorTypes.color(.colorPrimary)
        default:break
        }
        
    }
}
