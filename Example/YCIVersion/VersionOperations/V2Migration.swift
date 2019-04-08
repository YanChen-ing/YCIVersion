//
//  V2Migration.swift
//  YCIVersion_Example
//
//  Created by yanchen on 2019/1/7.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import YCIVersion

let exampleIdentifer = "example"

class V2Migration: VersionOperation {
    
    
    override init() {
        
        super.init()
        
        name = "这是一次神奇的改版"
        toVersion = 2
        
        next = V3Migration()
    }
    
    override func operate() throws {
        
        print("开始迁移操作 - ")
        
        for _ in 0..<3 {
            print("#")
            sleep(1)
        }
        
        throw NSError.init(domain: "yci", code: 111, userInfo: nil)
        
    }
    
    override func handleError(_ error: Error) -> Bool {
        
        print("处理异常：error" + error.localizedDescription)
        
        return true  // 错误无影响，可继续执行
        
//        return false // 终止后续执行
    }
}
