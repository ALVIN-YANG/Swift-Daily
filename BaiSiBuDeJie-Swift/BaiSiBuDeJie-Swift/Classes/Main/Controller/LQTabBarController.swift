//
//  LQTabBarController.swift
//  BaiSiBuDeJie-Swift
//
//  Created by 杨卢青 on 16/6/17.
//  Copyright © 2016年 杨卢青. All rights reserved.
//

import UIKit

class LQTabBarController: UITabBarController {

    // MARK: - Initial
    override class func initialize() {
        
        //创建属性字典
        var attr = [String : AnyObject]()
        
        attr[NSForegroundColorAttributeName] = UIColor(red: 81/255, green: 81/255, blue: 81/255, alpha: 1)
        //设置tabBarItem的字体选中的颜色
        UITabBarItem.appearance().setTitleTextAttributes(attr, forState: .Selected)
        
    }
    
    // MARK:- life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //添加所有子控制器
        addChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK:- Helper
    func addChildViewControllers()
    {
        let newTabBar = LQTabBar.init(frame: tabBar.bounds)
        setValue(newTabBar, forKey: "tabBar")
    }

    //添加一个子控制器
    private func setChildController(title: String, image: UIImage, selectedImage: UIImage, controller: UIViewController)
    {
        controller.tabBarItem.title = title
        controller.tabBarItem.image = image
        controller.tabBarItem.selectedImage = selectedImage

        let naviController = LQNavigationController.init(rootViewController: controller)
        addChildViewController(naviController)
    }

}
