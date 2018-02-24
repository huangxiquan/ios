//
//  ViewController.swift
//  MixNavigation
//
//  Created by huangxiquan on 2017/9/28.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var data: NSDictionary!;
    var cities: NSArray!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "provinces_cities", ofType: "plist");
        self.data = NSDictionary(contentsOfFile: path!);
        let navigationCtrl = self.parent as! UINavigationController;
        let selecedItem = navigationCtrl.tabBarItem.title;
        print(selecedItem);
        if(selecedItem == "黑龙江") {
            self.cities = self.data["黑龙江省"] as! NSArray;
            self.navigationItem.title = "黑龙江省信息";
        }else if(selecedItem == "吉林") {
            self.cities = self.data["吉林省"] as! NSArray;
            self.navigationItem.title = "吉林省信息";

        }else if(selecedItem == "辽宁") {
            self.cities = self.data["辽宁省"] as! NSArray;
            self.navigationItem.title = "辽宁省信息";
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CityCell")! as UITableViewCell;
        let city = self.cities[indexPath.row] as! NSDictionary;
        cell.textLabel?.text = city["name"] as! String;
        return cell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowDetail") {
            let indexPath = self.tableView.indexPathForSelectedRow! as IndexPath;
            let detailViewCtrl = segue.destination as! DetailViewController;
            let city = self.cities[indexPath.row] as! NSDictionary;
            detailViewCtrl.city = city;
            detailViewCtrl.title = city["name"] as! String;
        }
    }


}

