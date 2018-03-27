//
//  CustomNavigationController.swift
//  网易
//
//  Created by 李孔文 on 2018/3/25.
//  Copyright © 2018年 李孔文. All rights reserved.
//

//--------------------------全局手势-------------------------------------

import UIKit

class CustomNavigationController: UINavigationController  {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1、获取系统的pop手势
        guard let systemGes = interactivePopGestureRecognizer else {return}
        //2、获取手势添加到View中
        guard let gesViw = systemGes.view else {return}
        //3、获取target/action
        //3.1利用运行时查看所有属性的名称
        /**var count : UInt32 = 0
        let ivars = class_copyIvarList(UIGestureRecognizer.self, &count)
        for i in 0..<count {
            let ivar = ivars![Int(i)]
            let name = ivar_getName(ivar)
            print(String(cString: name!))
            
        }*/
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
//        print(targets)
        guard let targetObject = targets?.first else {
            return
        }
        //3.2取出target
        guard let target = targetObject.value(forKey: "target")  else {
            return
        }
        //3.3取出action
        let action = Selector(("handleNavigationTransition:"))
        
        //创建自己的pan手势
        let panGes = UIPanGestureRecognizer()
        gesViw.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
        
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        //隐藏要push控制器的tabbar
        viewController.hidesBottomBarWhenPushed = true
        
    }
    


}
