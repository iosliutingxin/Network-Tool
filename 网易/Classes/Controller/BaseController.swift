//
//  BaseController.swift
//  网易
//
//  Created by 李孔文 on 2018/3/25.
//  Copyright © 2018年 李孔文. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    //用于接收子控件的内容
    var contentView : UIView?
    
    fileprivate lazy var anmationImageView : UIImageView = { [weak self] in
        let iamgeView = UIImageView(image: UIImage(named: "pullrefresh_0"))
        iamgeView.center = (self?.view.center)!
        iamgeView.animationImages = [ UIImage(named: "pullrefresh_0")!, UIImage(named: "pullrefresh_1")!]
        iamgeView.animationDuration = 0.5
        iamgeView.animationRepeatCount = LONG_MAX
        iamgeView.autoresizingMask = [.flexibleTopMargin,.flexibleBottomMargin]

        return iamgeView
    }()
    //系统回调
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
     
    }
    
}

extension BaseController {
   //添加执行动画的UIIamgeView
    func setupUI()  {
        //1、隐藏内容view
        contentView?.isHidden = true
        
        //2、添加执行动画
        view.addSubview(anmationImageView)
        
        //3、执行动画
        anmationImageView.startAnimating()
    }
    
    //隐藏动画
    func loadDateFinished()  {
        //1、停止动画
        anmationImageView.stopAnimating()
        //2、隐藏anmationImageView
        anmationImageView.isHidden = true
        //3、显示内容view
        contentView?.isHidden = false
    }
}
