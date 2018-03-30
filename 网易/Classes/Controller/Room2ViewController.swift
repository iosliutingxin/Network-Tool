//
//  Room2ViewController.swift
//  网易
//
//  Created by 李孔文 on 2018/3/26.
//  Copyright © 2018年 李孔文. All rights reserved.
//

import UIKit

class Room2ViewController: UIViewController,UIGestureRecognizerDelegate {
    var model : baseModel?
    var name : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purple
        print("name===\(String(describing: name))")
        print("model ====\(String(describing: model))")
    }
    
    // 导航栏--即将显示页面
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //隐藏导航栏
        navigationController?.setNavigationBarHidden(true, animated: true)
        //保持手势
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    //显示导航栏
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)

    }

}
