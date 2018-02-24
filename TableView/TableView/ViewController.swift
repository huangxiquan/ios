//
//  ViewController.swift
//  TableView
//
//  Created by huangxiquan on 2017/9/26.
//  Copyright © 2017年 huangxiquan. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,UISearchBarDelegate {
    var teams: NSArray!;
    var filterTeams: NSMutableArray!;

    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //load data
        
        let path = Bundle.main.path(forResource: "team", ofType: "plist");
        self.teams = NSArray(contentsOfFile:path!);
        print(self.teams);
        
        self.searchBar.delegate = self;
        self.searchBar.showsScopeBar = false;
        self.searchBar.sizeToFit();
        self.filterContentForSearchText(searchText: "", scope: -1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filterTeams.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TeamCell = tableView.dequeueReusableCell(withIdentifier: "TeamCell") as! TeamCell;
        let row = indexPath.row;
        let team = self.filterTeams[row] as! NSDictionary;
        cell.myLabel.text = team["name"] as! String;
        cell.myImage.image = UIImage(named: String(format:"%@.png",team["image"] as! String));
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;
        return cell;
    }
    
    func filterContentForSearchText(searchText: NSString,scope: Int) {
        if(searchText.length == 0) {
            self.filterTeams = NSMutableArray(array: self.teams);
            return
        }
        var tempArray: NSArray!;
        if(scope == 1) {
            let predicate = NSPredicate(format:"SELF.image contains[c] %@",searchText);
            tempArray = self.teams.filtered(using: predicate) as NSArray!;
            self.filterTeams = NSMutableArray(array: tempArray);
        }else if(scope == 0) {
            let predicate = NSPredicate(format: "SELF.name contains[c] %@",searchText);
            tempArray = teams.filtered(using: predicate) as NSArray!;
            self.filterTeams = NSMutableArray(array: tempArray);
        }else {
            self.filterTeams = NSMutableArray(array: teams);
        }
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("searchBarShouldBeginEditing...");
        self.searchBar.showsScopeBar = true;
        self.searchBar.sizeToFit();
        return true;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.showsScopeBar = false;
        self.searchBar.resignFirstResponder();
        self.searchBar.sizeToFit();
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.filterContentForSearchText(searchText: "", scope: -1);
        self.searchBar.showsScopeBar = false;
        self.searchBar.resignFirstResponder();
        self.searchBar.sizeToFit();
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText: searchText as NSString , scope: self.searchBar.selectedScopeButtonIndex);
        self.tableView.reloadData();
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        self.filterContentForSearchText(searchText: self.searchBar.text! as NSString, scope: selectedScope);
        self.tableView.reloadData();
    }

}

