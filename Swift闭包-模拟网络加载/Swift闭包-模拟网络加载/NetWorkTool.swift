//
//  NetWorkTool.swift
//  Swift闭包-模拟网络加载
//
//  Created by 杨卢青 on 16/2/28.
//  Copyright © 2016年 杨卢青. All rights reserved.
//

import UIKit

class NetWorkTool : NSObject {

    //闭包名 : (闭包参数) -> (返回值)
    func loadData(finished : (String) -> ()){
        
        dispatch_async(dispatch_get_global_queue(0, 0)) { () -> Void in
        print("请求网络数据\(NSThread.currentThread())")
            dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                print("已经得到数据, 进行回调")
                finished("Data:...")
            })
        }
    }
}