//
//  ViewController.swift
//  Alert
//
//  Created by huangxiquan on 2017/9/25.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func alert(_ sender: Any) {
        var alert: UIAlertController = UIAlertController(
            title: "Alert",
            message: "Alert text goes here",
            preferredStyle: UIAlertControllerStyle.alert
        );
        alert.addAction(UIAlertAction(title: "No",style:UIAlertActionStyle.cancel,
                                      handler: nil
        ));
        
        alert.addAction(UIAlertAction(title: "Yes",style:UIAlertActionStyle.default,
                                      handler: nil
        ));
        
        self.present(alert, animated: true, completion: nil);
        
    }

    @IBAction func alertSheet(_ sender: Any) {
        var alertSheet: UIAlertController = UIAlertController();
        alertSheet.addAction(UIAlertAction(title: "取消",style: UIAlertActionStyle.cancel,handler: nil));
        alertSheet.addAction(UIAlertAction(title:"破坏性按钮",style: UIAlertActionStyle.destructive,handler: nil))
        alertSheet.addAction(UIAlertAction(title:"新浪微博",style:UIAlertActionStyle.default,handler: nil))
        
        self.present(alertSheet, animated: true, completion: nil)
    }
}

