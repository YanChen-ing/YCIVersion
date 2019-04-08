//
//  V1Creation.swift
//  YCIVersion
//
//  Created by yanchen on 2019/1/16.
//

import Foundation

class V1Creation: VersionOperation {
    
    
    override init() {
        
        super.init()
        
        name = "YCIVersion 初始化操作"
        toVersion = 1
    }
    
    override func operate() throws {
        
        // 记录版本信息到本地
        _ = isFirstInstall
        
    }
    
    override func handleError(_ error: Error) -> Bool {
        
        
        return true  // 错误无影响，可继续执行
        
        //        return false // 终止后续执行
    }
}

