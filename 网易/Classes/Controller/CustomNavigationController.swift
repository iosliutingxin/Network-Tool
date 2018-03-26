//
//  CustomNavigationController.swift
//  网易
//
//  Created by 李孔文 on 2018/3/25.
//  Copyright © 2018年 李孔文. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController ,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        
        //隐藏要push控制器的tabbar
        viewController.hidesBottomBarWhenPushed = true
        
    }
    
    // 导航栏--即将显示页面
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //隐藏导航栏
        navigationController?.setToolbarHidden(true, animated: true)
        //保持手势
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    //显示导航栏
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setToolbarHidden(false, animated: animated)
    }

}
