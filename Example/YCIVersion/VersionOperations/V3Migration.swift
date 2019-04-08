//
//  V3Migration.swift
//  YCIVersion_Example
//
//  Created by yanchen on 2019/1/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import YCIVersion

class V3Migration: VersionOperation {
    
    
    override init() {
        
        super.init()
        
        name = "修复BUG"
        toVersion = 3
        
    }
    
    override func operate() throws {
        
        print("开始迁移操作 - ")
        
        for _ in 0..<3 {
            print("###")
            sleep(1)
        }
        
        throw NSError.init(domain: "yci", code: 111, userInfo: nil)
        
    }
    
    override func handleError(_ error: Error) -> Bool {
        
        print("处理异常：error" + error.localizedDescription)
        
        return true
    }
}
