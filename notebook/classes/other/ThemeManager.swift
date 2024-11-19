//
//  ThemeManager.swift
//  notebook
//
//  Created by RSD on 2024/11/19.
//

import Foundation


enum ThemeStyle: Int {
    case system
    case light
    case dark
}

class ThemeManager {
    static let shared = ThemeManager()
        
    var currentTheme: ThemeStyle {
        get {
            let storedValue = UserDefaults.standard.integer(forKey: "selectedTheme")
            return ThemeStyle(rawValue: storedValue) ?? .system
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
            applyTheme(newValue)
        }
    }
        
    private init() {}
    
    private func applyTheme(_ theme: ThemeStyle) {
        let window = UIApplication.shared.windows.first
        switch theme {
        case .system:
            window?.overrideUserInterfaceStyle = .unspecified
        case .light:
            window?.overrideUserInterfaceStyle = .light
        case .dark:
            window?.overrideUserInterfaceStyle = .dark
        }
    }
    
    static func loadDefault(){
        self.shared.applyTheme(self.shared.currentTheme)
    }
}
