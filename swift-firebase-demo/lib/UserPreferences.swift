//
//  UserPreferences.swift
//  swift-firebase-demo
//
//  Created by Ray on 13/02/2017.
//  Copyright © 2017 Ray. All rights reserved.
//

import Foundation

class UserPreferences {
    
    private init() {
        
    }
    
    static func getString(key:String) -> String {
        let preference = UserDefaults.standard
        if let value = preference.string(forKey: key) {
            return value
        } else {
            return ""
        }
    }
    
    static func setString(key:String, value:String) -> Bool {
        let preference = UserDefaults.standard
        preference.set(value, forKey: key)
        return preference.synchronize()
    }
    
    
    
}
