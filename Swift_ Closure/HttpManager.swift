//
//  HttpManager.swift
//  Swift_ Closure
//
//  Created by 林琳 on 2017/1/10.
//  Copyright © 2017年 Ogemray. All rights reserved.
//

import UIKit

class HttpManager: NSObject {

    /**方法里含闭包返回数值*/
    static func getRequestData(urlString: String,paras: Dictionary<String,Any>?,resultBlock: ((_ result:Any?,_ error:Any?) -> Void)?) {
        
        var i = 0
        var address = urlString
        if let para = paras {
            for (key,value) in para {
                if i == 0 {
                    address += "?\(key)=\(value)"
                }else {
                    address += "&\(key)=\(value)"
                }
                i += 1
            }
        }
        //转换请求URL字符串中的特殊字符
        //NSString *url = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        let request = URLRequest.init(url: URL.init(string: address.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)!)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            if let data = data {
                guard let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
                    return
                }
                resultBlock!(result,nil)
            }else {
                resultBlock!(nil,error)
            }
        }
        dataTask.resume()
    }
    
    
    
    static func postRequestData(urlString:String,paras:Dictionary<String,Any>?,resultBlock: @escaping  (Any?,Any?) -> Void) {
        
        var i = 0
        var body:String = ""
        if let paras = paras {
            for (key,value) in paras {
                if i == 0 {
                    body += "\(key)=\(value)"
                }else {
                    body += "&\(key)=\(value)"
                }
                i += 1
            }
        }
        var request = URLRequest.init(url: URL.init(string: urlString)!)
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        request.allHTTPHeaderFields = ["Content-Type":"application/json"] //有的服务器端可能要加上这个请求头
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            if let data = data {
                guard let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
                    return
                }
                resultBlock(result,nil)
            }else {
                resultBlock(nil,error)
            }
            
        }
        dataTask.resume()
    }
    
}
