//
//  ViewController.swift
//  CBNWeekly
//
//  Created by huangxiquan on 2017/9/28.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initTabs();
        
        
    }
    
    func initTabs() {
        let tabs: [UITabBarItem] = self.tabBar.items!;
        let homeTab: UITabBarItem = tabs[0];
        homeTab.image = UIImage(named: "tabbar_home_normal")?.withRenderingMode(.alwaysOriginal);
        homeTab.selectedImage = UIImage(named: "tabbar_home_active")?.withRenderingMode(.alwaysOriginal);
        homeTab.title = "首页";
        
        let offPrintTab: UITabBarItem = tabs[1];
        offPrintTab.image = UIImage(named: "tabbar_offprint_normal")?.withRenderingMode(.alwaysOriginal);
        offPrintTab.selectedImage = UIImage(named: "tabbar_offprint_active")?.withRenderingMode(.alwaysOriginal);
        offPrintTab.title = "单行本";
        
        let magazineTab: UITabBarItem = tabs[2];
        magazineTab.image = UIImage(named: "tabbar_magazine_normal")?.withRenderingMode(.alwaysOriginal);
        magazineTab.selectedImage = UIImage(named: "tabbar_magazine_active")?.withRenderingMode(.alwaysOriginal);
        magazineTab.title = "杂志";
        
        let userTab: UITabBarItem = tabs[3];
        userTab.image = UIImage(named: "tabbar_user_normal")?.withRenderingMode(.alwaysOriginal);
        userTab.selectedImage = UIImage(named: "tabbar_user_active")?.withRenderingMode(.alwaysOriginal);
        userTab.title = "我的";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item);
    }


}

