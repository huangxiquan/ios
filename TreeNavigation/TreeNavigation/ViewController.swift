//
//  ViewController.swift
//  TreeNavigation
//
//  Created by huangxiquan on 2017/9/28.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var data: NSDictionary!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //load data
        let path = Bundle.main.path(forResource: "provinces_cities", ofType: "plist");
        self.data = NSDictionary(contentsOfFile: path!);
        print(self.data);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.allKeys.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProvinceCell")! as UITableViewCell;
        cell.textLabel?.text = self.data.allKeys[indexPath.row] as! String;
        return cell;
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("jump...");
        if(segue.identifier == "ShowSelectedProvince") {
            let cityViewCtrl: CitiesViewController = segue.destination as! CitiesViewController;
            let selectedPath: IndexPath = self.tableView.indexPathForSelectedRow! as IndexPath;
            let selectedName = self.data.allKeys[selectedPath.row] as! String;
            cityViewCtrl.cities = self.data[selectedName] as! NSArray;
            cityViewCtrl.title = selectedName;
            
        }
        
    }
}

