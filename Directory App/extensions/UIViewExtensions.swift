//
//  UIView.swift
//  Directory
//
//  Created by shikha on 05/02/22.
//

import Foundation
import UIKit

extension UIView{
    
    
    static func createRefreshControl(_ scrollView:UIScrollView, tint:UIColor = .gray)->UIRefreshControl{
        
        let refreshControl=UIRefreshControl()
        
        let attributes = [ NSAttributedString.Key.foregroundColor: tint ]
        let attributedString = NSAttributedString(string: "action_refresh", attributes: attributes)
        refreshControl.attributedTitle = attributedString
        
        refreshControl.tintColor=tint
        
        
        if #available(iOS 10.0, *) {
            scrollView.refreshControl = refreshControl
        } else {
            scrollView.addSubview(refreshControl)
        }
        
        return refreshControl
    }
    
    
}
