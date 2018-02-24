//
//  CitiesViewController.swift
//  TreeNavigation
//
//  Created by huangxiquan on 2017/9/28.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController {
    var cities: NSArray!;
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(self.cities);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
        if(segue.identifier == "ShowSelectedCity") {
            var detailViewCtrl = segue.destination as! DetailViewController;
            let selectedPath: IndexPath = self.tableView.indexPathForSelectedRow!;
            let city = self.cities[selectedPath.row] as! NSDictionary;
            detailViewCtrl.city = city;
            detailViewCtrl.title = city["name"] as! String;
        }
    }

}
