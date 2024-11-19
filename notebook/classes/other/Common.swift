//
//  Common.swift
//  livebook
//
//  Created by 赵超豪 on 2024/11/14.
//

import Foundation

@_exported import SwifterSwift
@_exported import RSDSwiftKit


// MARK: UIColor
public extension RSD where Base: UIColor {
    static func lineColor() -> UIColor{
        if UITraitCollection.current.userInterfaceStyle == .light {
            return UIColor.rsd.hex("F0F0F0")
        }else{
            return UIColor.rsd.hex("282828")
        }
    }
    
}


public enum KStore: String{
    case appTheme = "APP_KV_STORE_APP_THEME"
}

public struct VStore{
    
    static let APP_THEME_DARK = "dark"
    static let APP_THEME_Light = "light"
}


public struct Common{
   
}
