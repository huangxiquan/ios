//
//  ViewController.swift
//  ToolBar
//
//  Created by huangxiquan on 2017/9/25.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func save(_ sender: Any) {
        self.label.text = "点击 Save";
    }
    
    @IBAction func open(_ sender: Any) {
        self.label.text = "点击 Open";
    }
}

