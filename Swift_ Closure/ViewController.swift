//
//  ViewController.swift
//  Swift_ Closure
//
//  Created by 林琳 on 2017/1/10.
//  Copyright © 2017年 Ogemray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        simpleClosureShow()   // 简单的闭包实现及样式
        getRequest()    //Get请求测试
//        postRequest()     //Post请求测试
    }

    /** 简单的闭包实现及样式 */
    func simpleClosureShow() {
        
        //无参无返回值 闭包类型为:() -> Void
        let handler:() -> Void = {
            () in
            print("调用了无参无返回闭包")
        }
        handler()   //调用闭包
        
        //无参无返回简写 闭包类型为:() -> Void (注:可直接省略 () in )
        let simpleHandler:() -> Void = {
            print("调用了--简写--无参无返回闭包")
        }
        simpleHandler()    //调用闭包
        
        // 有参有返回 闭包类型为:(Int,Int) -> Int
        let addNumberHandler:(_ a:Int, _ b:Int) -> Int = {
            (a:Int, b:Int) in
            return a + b
        }
        let result = addNumberHandler(10,20) //调用闭包
        print("有参有返回-->返回值为:\(result)")
        
        // 有参有返回简写 闭包类型为:(Int,Int) -> Int
        let addNumberSimpleHandler:(Int,Int) -> Int = {
            (a,b) in
            return a + b
        }
        let resultSimple = addNumberSimpleHandler(10,20) //调用闭包
        print("有参有返回-->简写-->返回值:\(resultSimple)")
        
        /** 执行结果值输出:
         调用了无参无返回闭包
         调用了--简写--无参无返回闭包
         有参有返回-->返回值为:30
         有参有返回-->简写-->返回值:30
         */
    }
    
    /** Get请求测试 */
    func getRequest() {
        let urlStr = "http://yiapi.xinli001.com/v2/yi/ad-list.json?key=18ee0593a01c07f71d28fa936d671457&_platform=ios&_version=3.3.3&name=yiapp-home-ad"
        
        //尾随闭包简写形式
        HttpManager.getRequestData(urlString: urlStr, paras: nil) { (result, error) in
            if let result = result {
                print(result)
            }else {
                print("Get请求失败:\(error)")
            }
        }
        
 /*
        //正常书写方式
        HttpManager.getRequestData(urlString: urlStr, paras: nil  , resultBlock:{ (result, error) in
            if let result = result {
                print(result)
            }else {
                print("Get请求失败:\(error)")
            }
        })
 */
    }
    
    /** Post请求测试 */
    func postRequest() {
        let urlStr = "http://113.59.226.19:3000/PhoneAPI/Login"
        let dic:Dictionary<String,Any> = ["userName":"18939171276","password":"25f9e794323b453885f5181f1b624d0b","phoneMac":"eb:f2:14:4e:9b:88"]
        HttpManager.postRequestData(urlString: urlStr, paras: dic) { (result, error) in
            if let result = result {
                print(result)
            }else {
               print("Post请求失败\(error)")
            }
        }
    }
    
    
    @IBAction func PushToOtherViewController(_ sender: UIButton) {
        let otherVC = OtherViewController()
        //实现CallBack闭包属性-->等待调用
        otherVC.CallBack = {
            (name,age) in
            print("我的名字叫\(name),今年\(age)岁了")
        }
        self.navigationController?.pushViewController(otherVC, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

