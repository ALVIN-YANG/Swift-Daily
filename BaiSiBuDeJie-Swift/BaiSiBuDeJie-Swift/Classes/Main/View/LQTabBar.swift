//
//  LQTabBar.swift
//  BaiSiBuDeJie-Swift
//
//  Created by 杨卢青 on 16/6/17.
//  Copyright © 2016年 杨卢青. All rights reserved.
//

import UIKit

class LQTabBar: UITabBar {

    let plusButton = UIButton.init(type: .Custom);
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //添加加号按钮
        plusButton.setBackgroundImage(UIImage(named: "tabBar_publish_icon"), forState: .Normal)
        plusButton.setBackgroundImage(UIImage(named: "tabBar_publish_click_icon"), forState: .Highlighted)
        plusButton.addTarget(self, action:#selector(LQTabBar.presentView), forControlEvents: .TouchUpInside)
        
        addSubview(plusButton)
        
        //tabBar背景图片
        backgroundImage = UIImage.init(named: "tabbar-light");
    }
    
    /**
     *  加号点击事件
     */
    func presentView() {
//        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = frame.width * 0.2
        var buttonIndex:CGFloat = 0
        
        plusButton.sizeToFit()
        
        plusButton.center = self.center
        
        for item in subviews {
            if item.isKindOfClass(NSClassFromString("UITabBarButton")!) {
                //把中间位置空出
                item.frame = CGRect(x: width * (buttonIndex > 1 ? buttonIndex + 1 : buttonIndex), y: 0, width: width, height: item.frame.height)
                buttonIndex += 1
            }
        }
    }
}
