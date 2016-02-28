//
//  ViewController.swift
//  Swift闭包-模拟网络加载
//
//  Created by 杨卢青 on 16/2/28.
//  Copyright © 2016年 杨卢青. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var networkTool : NetWorkTool?
    override func viewDidLoad() {
        super.viewDidLoad()
        networkTool = NetWorkTool()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        networkTool?.loadData({ (data) -> () in
            print("\(data)")
        })
    }



}

