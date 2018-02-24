//
//  ViewController.swift
//  IndexTableView
//
//  Created by huangxiquan on 2017/9/26.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var teams: NSDictionary!;
    var groups: NSArray!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //load data
        let path = Bundle.main.path(forResource: "team_dictionary", ofType: "plist");
        self.teams = NSDictionary(contentsOfFile: path!);
        print(self.teams);
        var tempList = self.teams.allKeys as NSArray;
        self.groups = tempList.sortedArray(using: Selector("compare:")) as NSArray;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.groups.count;
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (self.groups[section] as! String)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section);
        let key = self.groups[section];
        let array = self.teams[key] as! NSArray;
        return array.count;
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TeamCell")! as UITableViewCell;
        let key = self.groups[indexPath.section];
        let array = self.teams[key] as! NSArray;
        let team = array[indexPath.row] as! String;
        cell.textLabel?.text = team;
        return cell;
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var titles = [String]();
        for item in self.groups {
            let title = (item as! NSString).substring(to: 1) as String;
            titles.append(title);
        }
        return titles;
    }
}

