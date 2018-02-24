//
//  ViewController.swift
//  Switch
//
//  Created by huangxiquan on 2017/9/25.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LeftSwitch: UISwitch!
    @IBOutlet weak var RightSwitch: UISwitch!
    @IBOutlet weak var SliderValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchValueChanged(sender: AnyObject) {
        NSLog("%@", "switch change...");
        let switcher = sender as! UISwitch;
        let setting = switcher.isOn;
        self.LeftSwitch.setOn(setting,animated:true);
        self.RightSwitch.setOn(setting,animated:true);
        
        
    }
    
    @IBAction func sliderValueChange(sender: AnyObject) {
    
        let slider = sender as! UISlider;
        let progress = Int(slider.value);
        self.SliderValue.text = String(format: "%d",progress);
    }
    
    @IBAction func touchDown(sender: AnyObject) {
        if(self.LeftSwitch.isHidden == true) {
            self.RightSwitch.isHidden = false;
            self.LeftSwitch.isHidden = false;
        }else {
            self.RightSwitch.isHidden = true;
            self.LeftSwitch.isHidden = true;
        }
    }
    
    
}

