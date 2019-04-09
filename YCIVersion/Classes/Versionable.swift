//
//  Versionable.swift
//  YCIVersion
//
//  Created by yanchen on 2019/1/3.
//

protocol Versionable {
    
    static var identifier: String {get}
    
    static var currentVersion: VersionNumber {get set}
    
    static func update()
    
}

/// 本组件标识。
let YCIVersionId = "YCIVersion"

public class YCIVersionManager: NSObject, Versionable {
    
    static var identifier: String = YCIVersionId
    
    static var currentVersion: VersionNumber = 2
    
    @objc public static func update() {
        VersionOperation.start(YCIVersionId, version: currentVersion, operation: V1Creation())
    }
    
}



