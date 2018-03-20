//
//  NetworkTools.swift
//  网易
//
//  Created by 李孔文 on 2018/3/18.
//  Copyright © 2018年 李孔文. All rights reserved.
//

import UIKit
import Alamofire

enum methodType {
    case get
    case post
    case hot
}
class NetworkTools: NSObject {

    class func requestDate(url : String , type : methodType ,parameters : [String : Any]? = nil , finishBack: @escaping(_ result : Any) -> ())  {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(url, method: method, parameters: parameters).responseJSON { (response) in
            //1、校验是否有结果
            guard let result = response.result.value else{
                debugPrint("error === \(response.result.error!)")
                return
                
            }
            
            //2、将结果返回
            finishBack(result)
        }
    }
}
