//
//  Util.swift
//  YCIVersion
//
//  Created by yanchen on 2019/1/14.
//

import Foundation

/**
 应用版本号。 如 1.2.0
 */
public let currentAppVersion: String = {
    
    guard let infoDict = Bundle.main.infoDictionary else {
        fatalError()
    }
    
    return infoDict["CFBundleShortVersionString"] as! String
}()


/**
 应用构建号（build)。 如 20180909
 */
public let currentAppBuild: String = {
    
    guard let infoDict = Bundle.main.infoDictionary else {
        fatalError()
    }
    
    return infoDict["CFBundleVersion"] as! String
}()

/**
 系统版本号。
 */
public let currentOSVersion : String = {
    let systemVersion = ProcessInfo.processInfo.operatingSystemVersion
    let systemVersionString = [systemVersion.majorVersion, systemVersion.minorVersion, systemVersion.patchVersion].map({String($0)}).joined(separator: ".")
    
    return systemVersionString
}()


/**
 首次安装。
 应用安装后，会在本地记录首次安装时的 Build 号。之后通过是否存在 Build 号来判断是否首次安装。
 */
public let isFirstInstall : Bool = {
    
    print("执行 isFirstInstall ")
    
    let firstInstallKey = "YCI_FirstInstall"
    
    if UserDefaults.standard.value(forKey: firstInstallKey) != nil {
        // 本地含有首次安装的 appBuild
        return false
    }
    
    // 首次安装，记录本次安装的 appBuild
    
    UserDefaults.standard.setValue(currentAppBuild, forKey: firstInstallKey)
    
    return true
}()
