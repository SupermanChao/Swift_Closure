//
//  OtherViewController.swift
//  Swift_ Closure
//
//  Created by 林琳 on 2017/1/10.
//  Copyright © 2017年 Ogemray. All rights reserved.
//

import UIKit

typealias Handler = (String,Int) -> Void

class OtherViewController: UIViewController {

    var CallBack:Handler?
    //或者 var CallBack:((String,Int)  -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func popToViewController(_ sender: UIButton) {
        self.CallBack!("超人",24) //调用CallBack闭包
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
