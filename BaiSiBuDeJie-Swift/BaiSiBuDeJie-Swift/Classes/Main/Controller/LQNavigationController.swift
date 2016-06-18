//
//  LQNavigationController.swift
//  BaiSiBuDeJie-Swift
//
//  Created by 杨卢青 on 16/6/17.
//  Copyright © 2016年 杨卢青. All rights reserved.
//

import UIKit

class LQNavigationController: UINavigationController {

    // MARK:- Life Cycle
    override class func initialize() {
        //设置naviBar背景图片
        UINavigationBar.appearance().setBackgroundImage(UIImage.init(named: "navigationbarBackgroundWhite"), forBarMetrics: UIBarMetrics.Default)
        //设置title字体
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName:UIFont.systemFontOfSize(20)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK:- push
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            //隐藏taBar
            viewController.hidesBottomBarWhenPushed = true
            
            viewController.navigationItem.leftBarButtonItem = setBackBarButtonItem()
        }
        super.pushViewController(viewController, animated: animated)
    }

    // MARK:- Helper
    func setBackBarButtonItem() -> UIBarButtonItem {
        let button = UIButton.init(type: .Custom)
        button.setImage(UIImage.init(named: "navigationButtonReturn"), forState: .Normal)
        button.setImage(UIImage.init(named: "navigationButtonReturnClick"), forState: .Highlighted)
        button.setTitle("返回", forState: .Normal)
        button.setTitleColor(UIColor.init(red: 81/255, green: 81/255, blue: 81/255, alpha: 1), forState: .Normal)
        button.addTarget(self, action: #selector(LQNavigationController.back), forControlEvents: .TouchUpInside)
        button.frame.size = CGSize.init(width: 100, height: 30)
        // 返回button里的内容左对齐
        button.contentHorizontalAlignment = .Left
        button.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: -10, bottom: 0, right: 0)
        
        return UIBarButtonItem.init(customView: button)
    }
    
    func back() {
        self.popViewControllerAnimated(true)
    }
}
