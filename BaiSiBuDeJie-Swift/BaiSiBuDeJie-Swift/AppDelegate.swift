//
//  AppDelegate.swift
//  BaiSiBuDeJie-Swift
//
//  Created by 杨卢青 on 16/6/17.
//  Copyright © 2016年 杨卢青. All rights reserved.
//

import UIKit
import Kingfisher

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow.init()
        
        let tabBarController = LQTabBarController.init()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        //显示引导页
        GuideView.show()
        return true
    }
    
    func applicationDidReceiveMemoryWarning(application: UIApplication) {
        let cache = KingfisherManager.sharedManager.cache
        cache.clearDiskCache()
        cache.clearMemoryCache()
        
    }
    
    //同页面多个ScrollView点击状态栏回到顶部
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let p = touches.first?.locationInView(self.window)
        if CGRectContainsPoint(UIApplication.sharedApplication().statusBarFrame, p!) {
            self
        }
        
    }
    
    func searchScrollViewInView(superView: UIView) {
        for item in superView.subviews {
            if item.isKindOfClass(UIScrollView) && item.isShowingOnKeyWindow() {
                
                let scrollView = item as! UIScrollView
                var offset = scrollView.contentOffset
                offset.y = -scrollView.contentInset.top
                scrollView.setContentOffset(offset, animated: true)
            }
            self.searchScrollViewInView(item)
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

