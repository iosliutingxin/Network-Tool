//
//  countDown.swift
//  网易
//
//  Created by 李孔文 on 2018/3/19.
//  Copyright © 2018年 李孔文. All rights reserved.
//

import UIKit

class countDown: UIView,UITextFieldDelegate{

    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var yzmText: UITextField!
    @IBOutlet weak var clickButton: UIButton!
    override func awakeFromNib() {
        //监听手机号改变
        phoneText.addTarget(self, action: #selector(phoneValueChange(tagert:)), for: UIControlEvents.editingChanged)
        //监听手机号改变
        yzmText.addTarget(self, action: #selector(yzmValueChange(tagert:)), for: UIControlEvents.editingChanged)
        //设定按钮为不可点击
        clickButton.isEnabled = false
        
        
    }

}

extension countDown{
    //提供一个快速创建View的类方法
    class func initCountDownView() -> countDown {
        return Bundle.main.loadNibNamed("countDown", owner: nil, options: nil)?.first as! countDown
    }
    
    @objc func phoneValueChange(tagert : UITextField) {
        
        guard self.verificationMobile(mobile: tagert.text!)  else {
            clickButton.isEnabled = false
            return
        }
        clickButton.isEnabled = true
    }
    
    @objc func yzmValueChange(tagert : UITextField) {
        
        print(self.verificationCode(code: tagert.text!))
        
    }
    
}
//正则表达式
extension countDown{
    //判断手机号
    func verificationMobile(mobile : String) -> Bool {
        let predicateStr = "^((13[0-9])|(15[^4,\\D]) |(17[0,0-9])|(18[0,0-9]))\\d{8}$"
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: mobile)
    }
    //判断验证码
    func verificationCode(code : String) -> Bool {
        let predicateStr = "(?<![0-9])([0-9]{4})(?![0-9])"
        let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
        return predicate.evaluate(with: code)
    }
    
}


