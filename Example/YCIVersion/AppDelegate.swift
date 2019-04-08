//
//  AppDelegate.swift
//  YCIVersion
//
//  Created by YanChen-ing on 04/08/2019.
//  Copyright (c) 2019 YanChen-ing. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        print(documentPath)
        
        return true
    }


}

