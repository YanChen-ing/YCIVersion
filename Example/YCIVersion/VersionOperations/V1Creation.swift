//
//  V1Creation.swift
//  YCIVersion_Example
//
//  Created by yanchen on 2019/1/17.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import YCIVersion

class V1Creation: VersionOperation {
    
    override init() {
        
        super.init()
        
        name = "项目初始化"
        toVersion = 1
    }
    
    override func operate() throws {
        
        // 记录版本信息到本地
        _ = isFirstInstall
        
    }
    
}
