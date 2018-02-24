//
//  ViewController.swift
//  DatePicker
//
//  Created by huangxiquan on 2017/9/26.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(_ sender: Any) {
        var date: Date = self.datePicker.date;
        var format: DateFormatter = DateFormatter();
        format.dateFormat = "YYYY-MM-dd HH:mm:ss";
        var dateStr = format.string(from: date);
        self.label.text = dateStr;
    }

}

