//
//  ViewController.swift
//  AutoLayou01
//
//  Created by huangxiquan on 2017/10/13.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        for constraint in self.view.constraints {
            print(constraint)
        }
//        for constraint in self.label.constraints {
////            print(constraint)
//        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.label.text = "hello world";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

