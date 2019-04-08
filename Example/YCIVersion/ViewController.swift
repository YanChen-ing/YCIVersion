//
//  ViewController.swift
//  YCIVersion
//
//  Created by YanChen-ing on 04/08/2019.
//  Copyright (c) 2019 YanChen-ing. All rights reserved.
//

import UIKit
import YCIVersion

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        start()
        
        migrating()
        
        onlyOnceAlert()
        
    }
    
    
    /// YCIVersion 启动。执行部分其自身的版本化操作
    func start() {
        
        YCIVersionManager.update()
        
        print("isFirstInstall: " + YCIVersion.isFirstInstall.description)
        
    }
    
    /// 迁移
    func migrating() {
        
        // 更改存储方案
        //        YCIVersion.Storage.TrueWorkerType = MyStorage.self
        
        let startOperation = V1Creation()
        //        let startOperation = V2Migration()
        
        YCIVersion.VersionOperation.start(exampleIdentifer, version: 3, operation: startOperation)
        
    }
    
    
    /// 引导弹窗
    func onlyOnceAlert() {
        
        let vOperation = V2Guide.init()
        
        // 传入需要的信息
        vOperation.vc = self
        vOperation.vcDescription = {
            return self.description
        }
        
        YCIVersion.VersionOperation.start("V2Guide", version: 4, operation: vOperation)
        
    }
    
    
}

