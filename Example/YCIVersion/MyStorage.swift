//
//  MyStorage.swift
//  YCIVersion_Example
//
//  Created by yanchen on 2019/1/9.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import YCIVersion

fileprivate let prefix = "YC_"

class MyStorage: Storage {
    
    // lastVersion : 本地版本号，应用之前运行的组件版本
    override class func lastVersion(forId identifer:String) -> VersionNumber {
        
        print("使用 MyStorage ：lastVersion")
        
        if let v = UserDefaults.standard.value(forKey: prefix + identifer) as? NSNumber {
            
            return v.uint64Value
            
        }
        
        return 0
    }
    
    
    override class func saveLastVersion(forId identifer:String, version: VersionNumber) {
        
        
        print("使用 MyStorage ：saveLastVersion")
        
        UserDefaults.standard.setValue(NSNumber(value: version), forKey: prefix + identifer)
        
    }
    
    
}
