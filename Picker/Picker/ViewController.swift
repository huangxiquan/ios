//
//  ViewController.swift
//  Picker
//
//  Created by huangxiquan on 2017/9/26.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var data: NSDictionary!;
    var provinces: NSArray!;
    var cities: NSArray!;
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //load data
        
        let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist");
        let dict = NSDictionary(contentsOfFile: plistPath!);
        self.data = dict;
        print(data)
        self.provinces = self.data.allKeys as NSArray!;
        let select = provinces[0];
        print(select);
        self.cities = self.data[select] as! NSArray;
        print(cities);
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click(_ sender: Any) {
        let row1 = self.pickerView.selectedRow(inComponent: 0);
        let row2 = self.pickerView.selectedRow(inComponent: 1);
        let province = self.provinces[row1] as! String;
        let city = self.cities[row2] as! String;
        self.label.text = String(format:"%@,%@市",province,city);
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0) {
            return self.provinces.count;
        }else {
            return self.cities.count;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0) {
            return self.provinces[row] as! String;
        }else {
            return self.cities[row] as! String;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0) {
            let select = self.provinces[row] as! String;
            self.cities = self.data[select] as! NSArray;
            self.pickerView.reloadComponent(1);
        }
    }

}

