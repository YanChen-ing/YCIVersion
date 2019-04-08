//
//  Storage.swift
//  YCIVersion
//
//  Created by yanchen on 2019/1/3.
//

import Foundation

public typealias VersionNumber = UInt64

let VersionNumberMAX: UInt64 = UINT64_MAX

fileprivate let prefix = "YCI_"

/**
 存储器，当前使用 UserDefaults 来存储版本信息。
 
 @discussion: 负责版本信息的记录，更新。使用时通过 Storage.TrueWorkerType... 方式访问，TrueWorkerType 为真实调用的实现类，通过继承，重写，并替换TrueWorkerType 可以更改版本村塾方式。
 */
open class Storage: NSObject {
    
    @objc public static var TrueWorkerType: Storage.Type = Storage.self
    
    // lastVersion : 本地版本号，应用之前运行的组件版本
    @objc open class func lastVersion(forId identifer:String) -> VersionNumber {
        
        if let v = UserDefaults.standard.value(forKey: prefix + identifer) as? NSNumber {
            
            return v.uint64Value
            
        }
        
        return 0
    }
    
    
    @objc open class func saveLastVersion(forId identifer:String, version: VersionNumber) {
        
        UserDefaults.standard.setValue(NSNumber(value: version), forKey: prefix + identifer)
        
    }
    
    
}

