//
//  VersionOperation.swift
//  YCIVersion
//
//  Created by yanchen on 2019/1/3.
//



/*
 @abstract 版本操作，用于封装版本间差异需执行的行为
 
 @discussion
 
 主要子类：
 
 一.Migration / 迁移
    负责封装一系列版本迁移操作，一般组成链使用，也可单独使用
 
    命名建议使用:  V + 待迁移版本 + Migration
    例如 20181111 -> 20190101
    文件命名为：V20181111Migration
 
 二.Guide / 引导
 
    负责某些版本升级，仅执行一次的引导弹窗
 
    命名建议使用:  V + 新版本 + Guide
    例如 20181111 -> 20190101
    文件命名为：V20190101Guide
 
 三.Creation / 创建
 
    用以支持某些版本运行必须的创建操作，一般与 Migration 组成链使用
 
     命名建议使用:  V + 新版本 + Creation
     例如 20181111 -> 20190101
     文件命名为：V20190101Creation
 
 */
open class VersionOperation: NSObject {
    
    @objc public var name: String           = "未命名"

    /// 操作执行到版本，即小于等于改版本号，此操作都会执行
    @objc public var toVersion: VersionNumber   = 1
    
    @objc public var next: VersionOperation?
    
    
    /// 开始迁移
    ///
    /// - Parameters:
    ///   - identifer: 组件识别符
    ///   - version: 当前组件版本号
    ///   - Operation: 迁移操作
    @objc public static func start(_ identifer: String, version: VersionNumber, operation: VersionOperation) {
        
        let lastVersion = Storage.TrueWorkerType.lastVersion(forId: identifer)
        
        // 本地版本 < 组件版本
        guard lastVersion < version else {
            NSLog("%@ 已为最新版本: %d", identifer, version)
            return
        }
        
        // 本地版本 < 可迁移至版本
        if lastVersion < operation.toVersion {
            
            NSLog("%@: %d -> %d  %@", identifer, lastVersion, operation.toVersion, operation.name)
            
            
            do{
                try operation.operate()
                
            }catch{
                
                NSLog("迁移错误：%@: %d -> %d ， %@", identifer, lastVersion, operation.toVersion, error.localizedDescription )
                
                guard operation.handleError(error) else { return }
                
            }
            
            // 迁移成功，存储版本号
            Storage.TrueWorkerType.saveLastVersion(forId: identifer, version: operation.toVersion)
            
        }
        
        
        if let next = operation.next {
            // 下一个操作
            
            start(identifer, version: version, operation: next)
            
        }else {
            // 此为最后操作
            
//            assert(operation.toVersion <= version, "迁移操作版本错误，请更新组件版本号")
            
            Storage.TrueWorkerType.saveLastVersion(forId: identifer, version: version)
            
        }
        
    }
    
    
    
    /// 子类重写，具体操作内容
    ///
    /// - Throws: error
    @objc open func operate() throws {
        
    
    }
    
    
    /// 子类重写，异常处理
    ///
    /// - Parameter error: error
    /// - Returns: 是否执行后续操作
    @objc open func handleError(_ error:Error) -> Bool {
        
        print("处理异常：error" + error.localizedDescription)
        
        return false
    }
    
}
