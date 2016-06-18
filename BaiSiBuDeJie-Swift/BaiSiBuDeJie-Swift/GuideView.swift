//
//  GuideView.swift
//  BaiSiBuDeJie-Swift
//
//  Created by 杨卢青 on 16/6/17.
//  Copyright © 2016年 杨卢青. All rights reserved.
//

import UIKit

class GuideView: UIView {


    @IBAction func hideButtonClick(sender: AnyObject) {
        removeFromSuperview()
    }

    //显示引导页
    class func show() {
        let key = "CFBundleVersion"
        //获取当前软件的版本号
        let currentVersion = NSBundle.mainBundle().infoDictionary![key]?.integerValue
        //获取沙盒中存储的版本号
        let lastVersion = NSUserDefaults.standardUserDefaults().integerForKey(key)
        
        if currentVersion != lastVersion {
            let window = UIApplication.sharedApplication().keyWindow
            let view = NSBundle.mainBundle().loadNibNamed("GuideView", owner: self, options: nil)[0] as! UIView
            
            view.frame = window!.bounds
            window!.addSubview(view)
            
            NSUserDefaults.standardUserDefaults().setInteger(currentVersion!, forKey: key)
            //通过synchronize方法来使内存中的缓存与系统默认数据库进行同步
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
  
}
