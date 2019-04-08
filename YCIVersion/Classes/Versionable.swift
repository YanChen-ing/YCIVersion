//
//  Versionable.swift
//  YCIVersion
//
//  Created by yanchen on 2019/1/3.
//

protocol Versionable {
    
    static var identifier: String {get}
    
    static var version: VersionNumber {get set}
    
    static func update()
    
}

/// 本组件标识。
let YCIVersionId = "YCIVersion"

public class YCIVersionManager: NSObject, Versionable {
    
    static var identifier: String = YCIVersionId
    
    static var version: VersionNumber = 2
    
    @objc public static func update() {
        VersionOperation.start(YCIVersionId, version: version, operation: V1Creation())
    }
    
}

/* TODO:

 
 ？减少链的执行次数
 
 ? 命名优化，OC混编优化
 
 */



