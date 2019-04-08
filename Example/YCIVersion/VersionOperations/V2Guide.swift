//
//  V2Guide.swift
//  YCIVersion_Example
//
//  Created by yanchen on 2019/1/10.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import YCIVersion

class V2Guide: VersionOperation {
    
    @objc public var vc: UIViewController?
    
    /// 通过闭包获取信息
    @objc public var vcDescription: (() -> String)?
    
    override init() {
        
        super.init()
        
        name = "v2 引导页"
        toVersion = 300
        
    }
    
    override func operate() throws {
        
        print("引导弹窗")
        
        let message = vcDescription?() ?? "这是个引导弹窗"
        
        let alert = UIAlertController.init(title: "V2", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        
        vc?.present(alert, animated: true, completion: nil)
        
    }
    
//    override func handleError(_ error: Error) -> Bool {
//
//        print("处理异常：error" + error.localizedDescription)
//
//        return true  // 错误无影响，可继续执行
//
//        //        return false // 终止后续执行
//    }
    
    
    
}
