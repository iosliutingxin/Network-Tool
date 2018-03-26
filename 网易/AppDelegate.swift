//
//  AppDelegate.swift
//  网易
//
//  Created by 李孔文 on 2018/3/17.
//  Copyright © 2018年 李孔文. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //设置状态栏为白色
        application.statusBarStyle = .lightContent
        return true
    }


}

