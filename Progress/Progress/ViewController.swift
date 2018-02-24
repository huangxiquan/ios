//
//  ViewController.swift
//  Progress
//
//  Created by huangxiquan on 2017/9/25.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func upload(_ sender: Any) {
        if(loading.isAnimating) {
            loading.stopAnimating()
        }else {
            loading.startAnimating()
        }
    }
    var timber: Timer!;
    @IBAction func download(_ sender: Any) {
        timber = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in
//                print("timer");
            self.progress.progress = self.progress.progress + 0.1;
            if(self.progress.progress == 1.0) {
                self.timber.invalidate();
                var alert:UIAlertController =  UIAlertController(title:"温馨提示",message:"下载完成",preferredStyle: UIAlertControllerStyle.alert);
                    alert.addAction(UIAlertAction(
                    title: "OK",style: UIAlertActionStyle.default,handler: { (action: UIAlertAction!) -> Void in
                        print("OK...");
                    }
                    ))
                self.present(alert,animated: true,completion: nil);
            }
            })
    }
}

