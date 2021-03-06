//
//  MXNetWorkTool.swift
//  MXDouYuZhiBo
//
//  Created by 刘智援 on 2016/10/29.
//  Copyright © 2016年 lyoniOS. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class MXNetWorkTool: NSObject {

}

extension MXNetWorkTool{
    //封装请求方法
    class func requestData(type : MethodType , urlString : String , parameters : [String : AnyObject],finishedCallback : @escaping (_ result : AnyObject) -> ()) {
        
        //判断请求方式
        let method = type == .get ? Alamofire.HTTPMethod.get : Alamofire.HTTPMethod.post

        // 2.发送网络请求
        Alamofire.request(urlString, method: method, parameters: parameters).responseJSON { (response) in
//            MXPrint(message: response)
            // 3.获取结果
            guard let result = response.result.value else {
//                MXPrint(message: response.result.error!)
                return
            }
            
            // 4.将结果回调出去
            finishedCallback(result as AnyObject)
        }
    }
}
