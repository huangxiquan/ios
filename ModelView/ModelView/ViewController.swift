//
//  ViewController.swift
//  ModelView
//
//  Created by huangxiquan on 2017/9/27.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(registerNotification(notification:)), name: NSNotification.Name("register"), object: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNotification(notification: NSNotification) {
        let param = notification.userInfo;
        let userName = param?["userName"];
        print(userName);
    }

}

