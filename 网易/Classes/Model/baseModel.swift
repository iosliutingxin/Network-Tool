//
//  baseModel.swift
//  网易
//
//  Created by 李孔文 on 2018/3/19.
//  Copyright © 2018年 李孔文. All rights reserved.
//
import UIKit
@objcMembers
class baseModel: NSObject {
    
    var replyCount : Int = 0
    var title : String = ""
    var source : String = ""
    var imgsrc : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
